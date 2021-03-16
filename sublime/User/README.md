# Installation instructions

* ## Sublime Executable (portable)
    [Download Portable Sublime 3](https://www.sublimetext.com/3)
* ## Sublime Package
    #### Install Sublime Package Control
    * Click the Preferences > Browse Packages… menu
    * Browse up a folder and then into the Installed Packages/ folder
    * Download [Package Control.sublime-package](https://packagecontrol.io/Package%20Control.sublime-package) and copy it into the Installed Packages/ directory
    * Restart Sublime Text

    #### Sublime Packages
    * `` Sidebar Enhancements ``
    * `` Project Manager ``
    * SublimeGit
    * SFTP
    * BracketHighlighter
    * TerminalView
    * FunctionNameDisplay
    * GitGutter
    * SublimeLinter
    * PackageControl
    * PackageResourceViewer
    * GitSavvy
    * Status Bar Time
    * UnDoClosedTab
    * SummitEditor
    * Assorted Gutter Themes
    * SublimeCodeIntel
    * DocBlockr
    * DocBlockr_Python
    * AllAutocomplete	
    * Alignment
    * Color Highlighter
    * AutoFileName
    * ColorPicker
    * Xdebug Client
    * PHP:
        * SublimePHPIntel
        * SublimeLinter-php
        * PHPCodeBeautifier
        * Laravel5 Snippets
        * PHP Twig tmBundle
        * Sublime PHP Companion
    * HTML
        * Emmet
    * Themes
        * ColorSchemes
            * `` Monokai Pro ``
            * Agila
            * Ayu --> AFileIcon
            * Boxy
            * AfterGlow
            * AlpenGlow
            * CityLights
            * AdeventureTime
            * Seti   
        * UI
            * `` Monokai Pro ``
            * SeaLion
            * SuperFlatAdventures
            * DA UI
            * Monokai Extended

* ## Auto Install Packages
    * Replace existing User directory.
    * Restart ST
* ## Settings
    * Duplicate Snippets

        * Open the folder where ST is installed
        * Open sublime_plugin.py
        * Find def on_query_completions
        * Replace return (completions, flags) with return (list(set(completions)), flags)"
        * Save the file
        * Restart ST