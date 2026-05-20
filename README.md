# <p align="center">
  <img src="SerieMeter/src/main/webapp/assets/images/favicon.png" alt="Project Logo" width="300">
  SerieMeter
</p>

A full-stack web application for discovering, rating, and reviewing movies and television series. Built with Java Servlets, JSP, and MySQL, deployed on Apache Tomcat.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation and Setup](#installation-and-setup)
- [Database Schema](#database-schema)
- [Usage](#usage)
- [Team](#team)

---

## Overview

SerieMeter is a community-driven media tracking platform that allows users to explore a curated library of films and series, submit ratings and written reviews, and maintain a personal bookmark collection. Administrators manage the content catalogue through a dedicated dashboard with analytics reporting.

---

## Features

**Public**
- Browse movies and series by genre, category, or release year
- Search and filter the full media catalogue
- View individual media pages with synopsis, director, runtime, and community ratings
- Randomise media selection

**Registered Users**
- Submit star ratings and written reviews
- Add and remove bookmarks
- Personal profile page showing review history and bookmarked titles
- Sort reviews and bookmarks by oldest or newest
- Edit profile details, username, and password
- Remember me functionality via persistent cookie

**Administrators**
- Secure admin dashboard with media management table
- Publish new movies and series with poster upload
- Edit existing media details and replace poster images
- Delete media entries
- View registered users and their review counts
- Read all submitted contact feedback
- Report and analytics page showing KPI stats, review distribution by genre, and top engaging titles

---

## Technology Stack

| Layer | Technology |
|---|---|
| Language | Java 21 |
| Web Framework | Jakarta Servlet 6.0, JSP, JSTL 3.0 |
| Server | Apache Tomcat 10.1 |
| Database | MySQL 8 |
| JDBC Driver | MySQL Connector/J 9.6 |
| Password Hashing | jBCrypt 0.4 |
| Build Tool | Apache Maven |
| Frontend | HTML5, CSS3, Vanilla JavaScript |

---

## Project Structure

```
SerieMeter/
├── src/
│   └── main/
│       ├── java/com/seriemeter/
│       │   ├── controller/        Servlets (Login, Register, Media, Bookmark, Admin*)
│       │   ├── dao/               Data access objects (UserDAO, MediaDAO, ReviewDAO, ...)
│       │   ├── filter/            Servlet filters (AuthenticationFilter, AdminFilter, RememberMeFilter)
│       │   ├── model/             Plain Java models (UserModel, MediaModel, ReviewModel, ...)
│       │   ├── service/           Business logic layer (LoginService, RegisterService, ...)
│       │   └── utils/             Utilities (DBconfig, PasswordUtil, FileUploadUtil, SessionUtil)
│       └── webapp/
│           ├── assets/            Static assets (CSS, icons, images)
│           ├── components/        Reusable JSP fragments (navbar, footer, adminHeader)
│           ├── WEB-INF/
│           │   ├── pages/         All JSP views
│           │   └── web.xml        Servlet configuration and error page mapping
│           └── index.jsp          Landing page
└── pom.xml
```

---

## Prerequisites

- Java Development Kit 21 or higher
- Apache Maven 3.8 or higher
- Apache Tomcat 10.1
- MySQL 8.0 or higher
- An IDE with Maven and Tomcat support (Eclipse, IntelliJ IDEA)

---

## Installation and Setup

**1. Clone the repository**

```bash
git clone https://github.com/Shirbhooshan/SerieMeter.git
cd SerieMeter
```

**2. Create the database**

Log into MySQL and run the following to create the schema and required tables:

```sql
CREATE DATABASE seriemeter;
USE seriemeter;

CREATE TABLE users (
    user_id       INT AUTO_INCREMENT PRIMARY KEY,
    full_name     VARCHAR(100)        NOT NULL,
    username      VARCHAR(50)         NOT NULL UNIQUE,
    email         VARCHAR(100)        NOT NULL UNIQUE,
    password_hash VARCHAR(255)        NOT NULL,
    role          ENUM('User','Admin') DEFAULT 'User',
    user_profile  VARCHAR(255)
);

CREATE TABLE category (
    category_id   INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE genre (
    genre_id   INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL
);

CREATE TABLE media (
    media_id     INT AUTO_INCREMENT PRIMARY KEY,
    title        VARCHAR(150)  NOT NULL,
    director     VARCHAR(100),
    release_date DATE,
    total_time   VARCHAR(20),
    description  TEXT,
    media_profile VARCHAR(255),
    category_id  INT,
    genre_id     INT,
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (genre_id)    REFERENCES genre(genre_id)
);

CREATE TABLE review (
    review_id   INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT NOT NULL,
    media_id    INT NOT NULL,
    rating      TINYINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id)  REFERENCES users(user_id),
    FOREIGN KEY (media_id) REFERENCES media(media_id)
);

CREATE TABLE watchlist (
    user_id    INT NOT NULL,
    media_id   INT NOT NULL,
    added_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, media_id),
    FOREIGN KEY (user_id)  REFERENCES users(user_id),
    FOREIGN KEY (media_id) REFERENCES media(media_id)
);

CREATE TABLE contact (
    feedback_no INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100),
    email       VARCHAR(100),
    message     TEXT
);

INSERT INTO category (category_name) VALUES ('Movie'), ('Series');

INSERT INTO genre (genre_name) VALUES
    ('Action'), ('Comedy'), ('Horror'), ('Drama'),
    ('Sci-Fi'), ('Thriller'), ('Romance'), ('Animation'),
    ('Documentary'), ('Crime');
```

**3. Configure the database connection**

Open `src/main/java/com/seriemeter/utils/DBconfig.java` and update the credentials to match your local MySQL instance:

```java
private static final String URL      = "jdbc:mysql://localhost:3306/seriemeter";
private static final String USER     = "root";
private static final String PASSWORD = "your_password";
```

**4. Create an admin account**

After registering a user through the application, manually update their role in the database:

```sql
UPDATE users SET role = 'Admin' WHERE username = 'your_username';
```

**5. Build the project**

```bash
mvn clean package
```

**6. Deploy to Tomcat**

Copy the generated `target/SerieMeter.war` file into your Tomcat `webapps/` directory, then start Tomcat. Alternatively, configure a Tomcat server in your IDE and run the project directly.

**7. Access the application**

```
http://localhost:8080/SerieMeter
```

---

## File Upload Storage

Uploaded images are stored outside the project directory under the user's home folder to persist across redeployments:

```
~/seriemeter_uploads/
├── user_uploads/     Profile pictures
└── media_uploads/    Media poster images
```

This path is resolved automatically at runtime via `System.getProperty("user.home")`.

---

```

Ratings are stored on a 1 to 5 scale and displayed throughout the application scaled to 10 by multiplying by 2.

---

## Usage

| URL | Description |
|---|---|
| `/Home` | Landing page |
| `/Explore` | Main browse page with trending, movies, and series |
| `/Movies` | Full movies listing |
| `/Series` | Full series listing |
| `/Search` | Search and filter with genre, category, and year filters |
| `/Media?id=` | Individual media detail and review page |
| `/Bookmark` | Authenticated user bookmark list |
| `/Bookmarks` | Unauthenticated user bookmark redirection |
| `/User` | User profile with reviews and bookmarks |
| `/UserEdit` | Edit profile details and password |
| `/Login` | Login page |
| `/Register` | Registration page |
| `/Dashboard` | Admin dashboard (admin only) |
| `/AdminContent` | Publish new media (admin only) |
| `/Edit` | Edit existing media (admin only) |
| `/Report` | Analytics and reporting (admin only) |
| `/Feedback` | View contact submissions (admin only) |
| `/Users` | View all registered users (admin only) |
| `/Contact` | Contact form |
| `/About` | About page |

---

## Team

Developed by second-year undergraduate students at Islington College.

| Name | Role |
|---|---|
| Shirbhooshan | Team Lead |
| Safiyah Malik | Developer |
| Shuvam Karki | Developer |
| Avin Subedi | Developer |

---

## License

This project was developed for academic purposes.
