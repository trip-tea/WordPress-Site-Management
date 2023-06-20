# WordPress-Site-Management
Streamline WordPress site management with this powerful bash script. Automate Docker and Docker Compose installation, effortlessly create, enable/disable, and delete sites.

## Prerequisites

- Docker: Ensure that Docker is installed on your system. If not, the script will automatically install it for you.
- Docker Compose: Ensure that Docker Compose is installed on your system. If not, the script will automatically install it for you.

## Installation

1. Download the `script.sh` file to your desired location.

2. Open a terminal or command prompt and navigate to the directory where the `script.sh` file is located.

3. Make the script executable by running the following command:

chmod +x script.sh


## Usage

To run the script, execute the following command:

./script.sh


The script will check if Docker and Docker Compose are installed on your system. If they are not found, the script will automatically install them for you.

Once the script is running, you will be presented with a menu-driven interface with the following options:

1. Create a WordPress site: This option allows you to create a new WordPress site. You will be prompted to enter a unique name for your site.

2. Enable/Disable a site: This option allows you to enable or disable an existing WordPress site. You will be prompted to enter the name of the site you want to enable or disable.

3. Delete a site: This option allows you to delete an existing WordPress site. You will be prompted to enter the name of the site you want to delete.

4. Quit: This option allows you to exit the script.

Follow the on-screen prompts and provide the necessary inputs to perform the desired operation. The script will execute the selected operation and provide feedback on the success or failure of the operation.

## Examples

Here are a few examples of how to use the script:

- To create a new WordPress site, choose option 1 from the menu, enter a unique name for the site when prompted, and the script will set up a new WordPress instance for you.

- To enable or disable an existing WordPress site, choose option 2 from the menu, enter the name of the site you want to enable or disable when prompted, and the script will start or stop the containers for that site.

- To delete an existing WordPress site, choose option 3 from the menu, enter the name of the site you want to delete when prompted, and the script will remove the site's containers and associated volumes.

## Customization

Feel free to customize and modify the script to fit your specific requirements. You can add additional functionality, tweak the Docker Compose configuration, or enhance the user interface as needed.

Please note that any modifications should be made with caution and understanding of the potential impacts.
