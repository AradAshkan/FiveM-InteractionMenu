# Interaction Menu for FiveM

## Overview

This project is an **Interaction Menu** designed for the FiveM platform, built to enhance the user interface for players in a GTA V roleplay server. It provides a sleek, modern menu system with features like personal information display, quest tracking, and admin controls, integrated with the ESX framework.

## Features

- **Personal Info**: Displays player details such as name, job, gang, cash, bank balance, coin balance, and experience level with a progress bar.
- **Quests**: Shows active quests with progress bars, dynamically updated based on player data.
- **Admin Panel**: Allows administrators to toggle duty status and perform actions like spectating, teleporting to, or freezing players.
- **Responsive Design**: The UI is styled with CSS for a modern look, including hover effects and animations.
- **Customizable**: Easily extendable with additional features or styling modifications.

## Requirements

- **FiveM Server** with the ESX framework installed.
- **MySQL-Async** for database operations.
- **QuestSystem** and **XP_Level_System** dependencies for quest and level configurations.
- **Font Awesome** for icons used in the UI.
- A compatible web browser for rendering the HTML-based UI.

## Installation

1. **Clone or Download**: Download the project files and place them in your FiveM server's `resources` folder.
2. **Configure Dependencies**: Ensure `mysql-async`, `QuestSystem`, and `XP_Level_System` are installed and configured in your server.
3. **Add to Server Config**: Add `ensure InteractionMenu` to your `server.cfg` file.
4. **Set Up Database**: Ensure the `quest` table is set up in your MySQL database to store quest data.
5. **Copy Assets**: Place the `html` folder (containing `index.html`, `scripts`, `styles`, and `fonts`) in the resource directory.
6. **Restart Server**: Restart your FiveM server or use `refresh` followed by `start InteractionMenu`.

## Usage

- **Open Menu**: Press the `I` key or use the `/menu` command to open the interaction menu.
- **Navigate Tabs**: Click on sidebar icons to switch between Personal Info, Quests, and Admin tabs (Admin tab is only visible to players with sufficient permissions).
- **Admin Actions**: Admins can toggle duty status and perform actions (Spectate, Goto, Freeze) on other players via the Admin tab.
- **Close Menu**: Press `Escape` or `Backspace` to close the menu.

## File Structure

- **client.lua**: Handles client-side logic, including NUI communication and command registration.
- **server.lua**: Manages server-side callbacks for fetching player data, quests, and coin balances.
- **fxmanifest.lua**: Resource manifest defining scripts, UI files, and dependencies.
- **html/index.html**: Main HTML file for the menu UI.
- **html/scripts/**: JavaScript files for handling UI interactions:
  - `script.js`: Core menu navigation and event listeners.
  - `personal.js`: Updates personal info and XP bar animations.
  - `quest.js`: Manages quest display and progress bar animations.
  - `admin.js`: Handles admin panel functionality and player actions.
- **html/styles/**: CSS files for styling:
  - `style.css`: General styles for the menu layout.
  - `quest.css`: Styles specific to the quests tab.
  - `admin.css`: Styles for the admin panel.
  - `fonts.css`: Custom font definitions (e.g., Yekan font).
- **html/fonts/**: Font files for the custom Yekan font.

## Configuration

- **QuestSystem Config**: Modify `@QuestSystem/Config.lua` to define quest data (e.g., `Config.JobQuests` and `Config.DefaultQuest`).
- **XP_Level_System Config**: Adjust `@XP_Level_System/config.lua` for level and XP settings (e.g., `config.Levels`).
- **UI Customization**: Edit CSS files in `html/styles/` to change colors, fonts, or layout.
- **Admin Permissions**: Ensure `xPlayer.permission_level` is set correctly in your ESX configuration to control access to the admin panel.

## Notes

- The commented-out code in `client.lua` (related to banking features) is not currently implemented but can be uncommented and customized for additional functionality.
- Ensure the `CoinSystem` export (`Q_Show_Coin_Player`) is available if using the coin balance feature.
- The admin panel is only visible to players with `permission_level > 0`.
- The UI uses the Yekan font for Persian text support, with RTL (right-to-left) direction applied in the quests section.

## Troubleshooting

- **Menu Not Opening**: Verify that the resource is properly started and that the `html` folder is correctly placed.
- **Data Not Loading**: Check MySQL connectivity and ensure the `quest` table exists.
- **Admin Panel Not Visible**: Confirm that the player's `permission_level` is set correctly in the database.
- **UI Styling Issues**: Ensure all CSS and font files are correctly referenced in `index.html`.

## Contributing

Contributions are welcome! Feel free to submit pull requests or open issues on the project's GitHub repository.

## Author

- **Arad** | github.com/aradashkan

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
