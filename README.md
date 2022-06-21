# Na4
Physics based puzzle game for mobile devices created by one-man indie games studio immortal.digital. Na4 is coded using the appgamekit framework.
It reached top 10 new paid games on Google Play on release and was also featured as one of the flagship products built on the AGK platform.

# Features
- Stylistic graphics and audio design
- 100 hand-designed levels, many of which creatively involve custom coding to manipulate physics or design elements
- Proprietary UI library with internal event handler. Implements buttons, pages, scrolling selection screens. Works across all screen resolutions
- Created custom tools to aid in development, including level designer that integrates fully with game for testing and deployment

# Technical Challenges
- Optimisation on lower end devices; Overcame framerate drop by dynamically adjusting the physics simulation accuracy based on device performance. Increased simulation timestep and interpolated values to match target framerate
- Level design workflow; Built custom tool to design levels on a desktop environment which were hosted using a webserver application. Paired with client application that loaded levels from local network to hot test on mobile device
- Automatically rendered level previews for exported designs to be used by client application
- Used binary serialisation to export constructed levels and package with final product

# What People have to say about Na4

> I find myself coming back to your game to progress the more difficult levels! Well done on such a great design. Hope it does well for you

 Rick Vanner - TGC Development Director


# Screenshots

<img src="/files/dystopia.png" width="32%" height="32%"> <img src="/files/rain.png" width="32%" height="32%"> <img src="/files/lasers.png" width="32%" height="32%">
<img src="/files/levels.png" width="32%" height="32%"> <img src="/files/adfree.png" width="32%" height="32%">

# Download here!
https://play.google.com/store/apps/details?id=digital.immortal.na4

# Compilation

Import the project into the AGK IDE and compile!
