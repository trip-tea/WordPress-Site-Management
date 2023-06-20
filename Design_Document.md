**Design Document: WordPress Site Management Script**

**1. Introduction**
The WordPress Site Management Script is a bash script designed to automate the setup, management, and deletion of WordPress sites using Docker and Docker Compose. The script provides a user-friendly menu-driven interface to perform various operations on WordPress sites, including site creation, enabling/disabling sites, and site deletion.

**2. Requirements**
The script requires the following dependencies to be installed:
- Docker: The script checks if Docker is installed and installs it if necessary.
- Docker Compose: The script checks if Docker Compose is installed and installs it if necessary.

**3. Script Workflow**
The script follows the following workflow:

- **Docker Installation Check**: The script checks if Docker is installed on the system. If Docker is not found, it downloads the Docker installation script and executes it. The current user is added to the docker group to allow running Docker commands without sudo.

- **Docker Compose Installation Check**: The script checks if Docker Compose is installed on the system. If Docker Compose is not found, it downloads the Docker Compose binary and makes it executable.

- **Site Creation**: The script provides an option to create a new WordPress site. The user is prompted to enter a site name. A Docker Compose file is generated dynamically with the necessary configurations for the MySQL database and WordPress services. The site directory is created, and Docker Compose is used to start the containers. An entry is added to the `/etc/hosts` file to map the site name to the localhost IP address.

- **Site Enable/Disable**: The script provides an option to enable or disable a WordPress site. The user is prompted to enter the site name. The script navigates to the site directory and uses Docker Compose to start or stop the containers based on the user's choice.

- **Site Deletion**: The script provides an option to delete a WordPress site. The user is prompted to enter the site name. The script stops and removes the Docker containers and volumes associated with the site. The site directory is deleted, and the site name entry is removed from the `/etc/hosts` file.

- **Main Menu**: The script presents a main menu to the user with options to create a WordPress site, enable/disable a site, delete a site, or quit the script. The user's choice is read, and the corresponding function is executed based on the choice.

**4. Usage**
To use the script, follow these steps:
1. Ensure that Docker and Docker Compose are installed on the system.
2. Download the script and make it executable (`chmod +x script.sh`).
3. Run the script (`./script.sh`).
4. Choose the desired option from the main menu.
5. Follow the prompts and provide the necessary inputs as requested.
6. The script will perform the selected operation and provide appropriate feedback.

**5. Conclusion**
The WordPress Site Management Script simplifies the process of setting up, managing, and deleting WordPress sites using Docker and Docker Compose. By automating these tasks, the script saves time and effort for users, providing a convenient way to work with multiple WordPress sites.
