<img src="./readme/title1.svg"/>

<br><br>

<!-- project philosophy -->
<img src="./readme/title2.svg"/>

> A mobile app that connects passionate individuals with impactful volunteer opportunities. Forget endless searches and complicated applications. Discover causes you care about, explore relevant options, and take action - all with a few taps. Make a real difference in your community.
>
> Everyone can contribute. Our user-friendly platform connects you with causes you're passionate about, allowing you to find volunteer experiences that resonate and empower you to make a difference.

### User Stories

### Volunteer
- As a Volunteer, I want to receive notifications about upcoming volunteering events, fundraising campaigns, and advocacy initiatives from organizations I follow.
- As a Volunteer, I want to be able to easily access details about the organization, including their location and mission, to decide if it aligns with my interests.
- As a Volunteer, I want to be able to follow organizations to receive future notifications and easily join any live streams they host.

### Organization
- As an Organization, I want to access a comprehensive dashboard that includes real-time data visualizations from multiple sensors deployed in relevant locations (e.g., temperature, humidity, air quality).
- As an Organization, I want the platform to facilitate the sending of targeted notifications to relevant volunteers, outlining the situation and requesting their assistance.
- I want the ability to initiate live streams directly from the dashboard, showcasing the situation in real-time and further engaging potential volunteers who might be geographically dispersed.

### Admin
- As an Admin, I want to have a comprehensive user management system that allows me to send notifications to all users.
- As an Admin, I want the ability to create dedicated sections within the app for specific types of organizations.
- As an Admin, I want to integrate OpenAI capabilities within the platform for functionalities like predicting blood donation needs.

<br><br>

<!-- Tech stack -->
<img src="./readme/title3.svg"/>

### Coffee Express is built using the following technologies:

- This project uses the [Flutter app development framework](https://flutter.dev/). Flutter is a cross-platform hybrid app development platform which allows us to use a single codebase for apps on mobile, desktop, and the web.
- For persistent storage (database), the app uses the [Hive](https://hivedb.dev/) package which allows the app to create a custom storage schema and save it to a local database.
   - 🚨 Currently, we're working on extending it to cover the entire app!
- To send  notifications, the app uses the [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) with [firebase_messaging](https://pub.dev/packages/firebase_messaging) packages which supports Android, iOS, and macOS.
- Our app brings geographical contexts to life using the [Google Maps SDK](https://developers.google.com/maps/documentation). This integration allows us to display detailed maps, complete with interactive markers for each destination.
- This Project uses NestJs(https://docs.nestjs.com) framework for backend, NestJS is a progressive Node.js framework for building efficient, reliable, and scalable server-side applications. It leverages TypeScript and brings powerful features such as dependency injection, routing, middleware, and more, making it ideal for enterprise-grade development and API integration.
- To enhance user engagement, our app integrates an advanced [OpenAI](https://platform.openai.com/docs/introduction) endpoint powered by the GPT-3.5-turbo-instruct model. This AI-driven feature predicts the most needed type of blood, delivering valuable insights to administrators, who can then notify users via notifications.
- This project integrates data visualization through IoT using [Esp32](https://en.wikipedia.org/wiki/ESP32). Sensor data is sent in real-time to Firebase using [real time db](https://firebase.google.com/docs/database), and it is integrated with Flutter using [firebase_database](https://pub.dev/packages/firebase_database) package to display graphical representations

<br><br>

<!-- UI UX -->
<img src="./readme/title4.svg"/>

> We designed Coffee Express using wireframes and mockups, iterating on the design until we reached the ideal layout for easy navigation and a seamless user experience.

- Project Figma design [figma](https://www.figma.com/file/LsuOx5Wnh5YTGSEtrgvz4l/Purrfect-Pals?type=design&node-id=257%3A79&mode=design&t=adzbABt5hbb91ucZ-1)

### Mockups

| Home screen                             | Menu Screen                           | Order Screen                          |
| --------------------------------------- | ------------------------------------- | ------------------------------------- |
| ![Landing](./readme/demo/1440x1024.png) | ![fsdaf](./readme/demo/1440x1024.png) | ![fsdaf](./readme/demo/1440x1024.png) |

<br><br>

<!-- Database Design -->
<img src="./readme/title5.svg"/>

### Architecting Data Excellence: Innovative Database Design Strategies:

- Insert ER Diagram here

<br><br>

<!-- Implementation -->
<img src="./readme/title6.svg"/>

### User Screens (Mobile)

| Login screen                              | Register screen                         | Landing screen                          | Loading screen                          |
| ----------------------------------------- | --------------------------------------- | --------------------------------------- | --------------------------------------- |
| ![Landing](https://placehold.co/900x1600) | ![fsdaf](https://placehold.co/900x1600) | ![fsdaf](https://placehold.co/900x1600) | ![fsdaf](https://placehold.co/900x1600) |
| Home screen                               | Menu Screen                             | Order Screen                            | Checkout Screen                         |
| ![Landing](https://placehold.co/900x1600) | ![fsdaf](https://placehold.co/900x1600) | ![fsdaf](https://placehold.co/900x1600) | ![fsdaf](https://placehold.co/900x1600) |

### Admin Screens (Web)

| Login screen                            | Register screen                       | Landing screen                        |
| --------------------------------------- | ------------------------------------- | ------------------------------------- |
| ![Landing](./readme/demo/1440x1024.png) | ![fsdaf](./readme/demo/1440x1024.png) | ![fsdaf](./readme/demo/1440x1024.png) |
| Home screen                             | Menu Screen                           | Order Screen                          |
| ![Landing](./readme/demo/1440x1024.png) | ![fsdaf](./readme/demo/1440x1024.png) | ![fsdaf](./readme/demo/1440x1024.png) |

<br><br>

<!-- Prompt Engineering -->
<img src="./readme/title7.svg"/>

### Mastering AI Interaction: Unveiling the Power of Prompt Engineering:

- This project uses advanced prompt engineering techniques to optimize the interaction with natural language processing models. By skillfully crafting input instructions, we tailor the behavior of the models to achieve precise and efficient language understanding and generation for various tasks and preferences.

<br><br>

<!-- AWS Deployment -->
<img src="./readme/title8.svg"/>

### Efficient AI Deployment: Unleashing the Potential with AWS Integration:

- This project leverages AWS deployment strategies to seamlessly integrate and deploy natural language processing models. With a focus on scalability, reliability, and performance, we ensure that AI applications powered by these models deliver robust and responsive solutions for diverse use cases.

<br><br>

<!-- Unit Testing -->
<img src="./readme/title9.svg"/>

### Precision in Development: Harnessing the Power of Unit Testing:

- This project employs rigorous unit testing methodologies to ensure the reliability and accuracy of code components. By systematically evaluating individual units of the software, we guarantee a robust foundation, identifying and addressing potential issues early in the development process.

<br><br>

<!-- How to run -->
<img src="./readme/title10.svg"/>

> To set up Coffee Express locally, follow these steps:

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.

- npm
  ```sh
  npm install npm@latest -g
  ```

### Installation

_Below is an example of how you can instruct your audience on installing and setting up your app. This template doesn't rely on any external dependencies or services._

1. Get a free API Key at [example](https://example.com)
2. Clone the repo
   git clone [github](https://github.com/your_username_/Project-Name.git)
3. Install NPM packages
   ```sh
   npm install
   ```
4. Enter your API in `config.js`
   ```js
   const API_KEY = "ENTER YOUR API";
   ```

Now, you should be able to run Coffee Express locally and explore its features.
