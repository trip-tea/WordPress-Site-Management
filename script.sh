#!/bin/bash
# Check if docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker not found. Installing Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh  # Download Docker installation script
    sudo sh get-docker.sh  # Run the Docker installation script
    sudo usermod -aG docker $USER  # Add the current user to the docker group
    rm get-docker.sh  # Remove the Docker installation script
    echo "Docker installed successfully."
fi
# Check if docker-compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose not found. Installing Docker Compose..."
    sudo curl -fsSL https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose  # Download Docker Compose binary
    sudo chmod +x /usr/local/bin/docker-compose  # Make Docker Compose executable
    echo "Docker Compose installed successfully."
fi
# Function to create the WordPress site
create_site() {
    # Prompt for site name
    read -p "Enter site name: " site_name
    # Create Docker Compose file
    cat > docker-compose.yml <<EOF
version: '3'
services:
  db:
    image: mysql:latest
    environment:
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: password
      MYSQL_RANDOM_ROOT_PASSWORD: '1'
    volumes:
      - db_data:/var/lib/mysql
  wordpress:
    depends_on:
      - db
    image: wordpress:latest
    ports:
      - 80:80
    restart: always
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: password
      WORDPRESS_DB_NAME: wordpress
    volumes:
      - ./wp-content:/var/www/html/wp-content
volumes:
  db_data:
EOF
    # Create the site directory and start containers
    mkdir -p "$site_name"
    cd "$site_name" || exit
    docker-compose up -d
    # Add /etc/hosts entry
    sudo sed -i "/\blocalhost\b/d" /etc/hosts
    sudo sh -c "echo '127.0.0.1 $site_name' >> /etc/hosts"
    echo "Site created successfully. You can now open http://$site_name in your browser."
}
# Function to enable/disable the site
toggle_site() {
    # Prompt for site name
    read -p "Enter site name: " site_name
    # Start or stop the containers
    cd "$site_name" || exit
    docker-compose "$1"
}
# Function to delete the site
delete_site() {
    # Prompt for site name
    read -p "Enter site name: " site_name
    # Stop and remove containers and volumes
    cd "$site_name" || exit
    docker-compose down -v
    cd ..
    rm -rf "$site_name"
    sudo sed -i "/\b$site_name\b/d" /etc/hosts
    echo "Site deleted successfully."
}
# Main menu
while true; do
    echo "Please choose an option:"
    echo "1. Create a WordPress site"
    echo "2. Enable/Disable a site"
    echo "3. Delete a site"
    echo "4. Quit"
    read -p "Enter your choice: " choice

    case $choice in
        1) create_site ;;
        2) toggle_site "stop" ;;
        3) delete_site ;;
        4) break ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
    echo
done
