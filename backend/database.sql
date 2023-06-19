-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema origins_digital
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema origins_digital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `origins_digital` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ;

-- -----------------------------------------------------
-- Table `origins_digital`.`avatar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `origins_digital`.`avatar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `icons` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO avatar VALUES
(1, 'Black Cat', 'black_cat.png'), (2, 'Dark Pumpkin', 'dark_pumpkin.png'), (3, 'Frankenstein', 'frankenstein.png'), (4, 'Ghost', 'ghost.png'), (5, 'Green Demon', 'green_demon.png'), (6, 'Marsian', 'green_marsian.png'), (7, 'Green Pumpkin', 'green_pumpkin.png'), (8, 'Puke', 'head_puke.png'), (9, 'Little Bat', 'little_bat.png'), (10, 'Vampire', 'little_vmapire.png'), (11, 'Love Pumpkin', 'love_pumpkin.png'), (12, 'Momy', 'momy.png'), (13, 'Red demon', 'red_demon.png'), (14, 'Red head', 'red_head.png'), (15, 'Scary', 'scary_head.png'), (16, 'Pumpkin', 'smile_pumpkin.png'), (17, 'Star Pumpkin', 'star_pumpkin.png'), (18, 'Eye', 'the_eye.png'), (19, 'Skull', 'the_skull.png'), (20, 'Wolf', 'the_wolf.png');


-- -----------------------------------------------------
-- Table `origins_digital`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `origins_digital`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `banner` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO `category` VALUES
(1, 'HTML', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/640px-HTML5_logo_and_wordmark.svg.png'),
(2, 'React', 'https://web-id.fr/storage/logos%2FReact_logo_wordmark.png'),
(3, 'JavaScript', 'https://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png'),
(4, 'CSS', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/CSS3_logo_and_wordmark.svg/1452px-CSS3_logo_and_wordmark.svg.png'),
(5, 'Node.js', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Node.js_logo.svg/2560px-Node.js_logo.svg.png'),
(6, 'Next.js', 'https://mobisoftinfotech.com/resources/wp-content/uploads/2022/04/next-JS-framework.png'),
(7, 'Typescript', 'https://cdn.sanity.io/images/nrxsmjzk/production/2243fb2527b0b01633620965d60f6f45edc5cf8a-1240x698.png'),
(8, 'Express.js', 'https://upload.wikimedia.org/wikipedia/commons/6/64/Expressjs.png'),
(9, 'PHP', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/PHP-logo.svg/1200px-PHP-logo.svg.png'),
(10, 'Java', 'https://d1fmx1rbmqrxrr.cloudfront.net/zdnet/i/edit/ne/2021/09/logo_java.jpg'),
(11, 'SQL', 'https://cdn.ucberkeleybootcamp.com/wp-content/uploads/sites/106/2020/03/SQL-Coding-Class-San-Francisco-1.jpeg'),
(12, 'NoSQL', 'https://www.ambient-it.net/wp-content/uploads/2022/03/Logo-formation-fondamentaux-nosql-200x175-1.png');


-- -----------------------------------------------------
-- Table `origins_digital`.`user`
-- -----------------------------------------------------
 CREATE TABLE IF NOT EXISTS `origins_digital`.`user`(
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `premium`  varchar(50) NOT NULL DEFAULT 'NO',
  `avatar_id` int NOT NULL DEFAULT 1,
  `roles`  varchar(50) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`,`avatar_id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_user_avatar_idx` (`avatar_id`),
  CONSTRAINT `fk_user_avatar` FOREIGN KEY (`avatar_id`) REFERENCES `avatar` (`id`)
) ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `origins_digital`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `origins_digital`.`video` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `thumbnail` VARCHAR(255) NOT NULL,
  `duration` TIME NOT NULL,
  `free` TINYINT(1) NOT NULL,
  `category_id` INT NOT NULL,
  `likes` INT NOT NULL DEFAULT 0,
  `dislikes` INT NOT NULL DEFAULT 0,
  `author` VARCHAR(255) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`, `category_id`),
  CONSTRAINT `fk_video_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `origins_digital`.`category` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 37
DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO video VALUES
(1, 'What Is ReactJS ?',"In this React js Tutorial video, we learn all about ReactJS, it's features and some basic concepts required to build a React Application.", 'https://i.ytimg.com/vi/Y6aYx_KKM7A/hqdefault.jpg?sqp=-oaymwEjCPYBEIoBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLD5mNY27Tb_awlkrSyKCoLz2XBkQA', '00:09:29', TRUE, 2, 0, 0, 'Simplilearn', 'https://www.youtube.com/watch?v=Y6aYx_KKM7A'),
(2, 'What Is Javascript ?', 'What is JavaScript? This short video explains it in 5 minutes.', 'https://i.ytimg.com/vi/upDLs1sn7g4/hqdefault.jpg?sqp=-oaymwEjCPYBEIoBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLCFv9L3db-LCm6514So6r8E0-0cpg', '00:05:11', TRUE, 3, 0, 0, 'Programming with Mosh', 'https://www.youtube.com/watch?v=upDLs1sn7g4'),
(3, 'What Is Node ?', "What is Node? What is Node used for? Why should you learn this popular JavaScript runtime? We'll get you caught up in under 2 minutes.", 'https://i.ytimg.com/vi/ATCs2BY-acA/hqdefault.jpg?sqp=-oaymwEjCPYBEIoBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLBpmNuo1CrYxd8JCzsrJ_tbfdqpAA', '00:02:34', TRUE, 5, 0, 0, 'Zero to mastery', 'https://www.youtube.com/watch?v=ATCs2BY-acA'),
(4, 'CSS in 100 Seconds', 'Cascading Style Sheets or CSS is the language that makes HTML websites look pretty. Learn how concepts like cascade, specificity, inheritance, and the box model influence the appearance of a webpage', 'https://i.ytimg.com/vi/OEV8gMkCHXQ/hq720.jpg?sqp=-oaymwEjCOgCEMoBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLBbHG-fqx0lwkZk4Um6tmz_V-FfWw', '00:02:19', TRUE, 4, 0, 0, 'Fireship', 'https://www.youtube.com/watch?v=OEV8gMkCHXQ'),
(5, 'Typescript VS Javascript', "In this video, we’ll review TypeScript vs JavaScript - what’s better and how are they different?", 'https://i.ytimg.com/vi/3iAx52Y7IEc/hq720.jpg?sqp=-oaymwEjCOgCEMoBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLAwglva_I3bSVMDOWDDfvfedX7Lnw', '00:05:21', FALSE, 3, 0, 0, 'Tech in 5 minutes', 'https://www.youtube.com/watch?v=3iAx52Y7IEc'),
(6, 'Create Clean and Reusable React Components', "Let's make your react code clean and reusable to make your application easier to maintain.", 'https://i.ytimg.com/vi/Ib-80HIjuZ4/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLB5vt01XsS8dT18tccOkJi2YSneow', '00:21:53', TRUE, 2, 0, 0, 'Cand Dev', 'https://www.youtube.com/watch?v=Ib-80HIjuZ4'),
(7, 'PHP in 100 seconds','PHP Hypertext Preprocessor is a scripting language for creating dynamic websites on the server. It remains one of the most popular programming languages in the world, powering tools such as Wordpress, Laravel and Symfony', 'https://i.ytimg.com/vi/a7_WFUlFS94/hq720.jpg?sqp=-oaymwEjCOgCEMoBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLAVfPAvaC7is15phbp-yEgxfSZMUw', '00:02:20', TRUE, 9, 0, 0, 'Fireship', 'https://www.youtube.com/watch?v=a7_WFUlFS94'),
(8, 'JavaScript Functions', "Master the basics of JavaScript Functions in a fun tutorial packed full of 90s nostalgia.", 'https://img.youtube.com/vi/gigtS_5KOqo/maxresdefault.jpg', '00:12:26', TRUE, 3, 0, 0, 'Fireship', 'https://www.youtube.com/watch?v=gigtS_5KOqo'),
(9, '10 Tips To Improve Your Java Code Performance', "Performance and the readability of your code is a vital part when it comes to production level of your applications. There are many cool features of java that we can use to improve the readability of the code while increasing the performance of the code as well", 'https://i.ytimg.com/vi/frhNwZo_eQE/hq720.jpg?sqp=-oaymwEjCOgCEMoBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLAC4uKayIzce5z-vEW5svBq3otcIg', '00:08:35', FALSE, 10, 0, 0, 'Don Hash', 'https://www.youtube.com/watch?v=frhNwZo_eQE'),
(10, 'MongoDB Schema Design Best Practices',"Have you ever wondered, How do I model my schema for my application? It is one of the most common questions devs have pertaining to MongoDB. This is because document databases have a rich vocabulary that is capable of expressing data relationships in more nuanced ways than SQL.", 'https://i.ytimg.com/vi/QAqK-R9HUhc/hq720.jpg?sqp=-oaymwEjCOgCEMoBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLAXm9ykU6Agrypr_EcOrG-CI-XIpw', '00:09:57', FALSE, 12, 0, 0, 'MongoDB', 'https://www.youtube.com/watch?v=QAqK-R9HUhc'),
(11, 'JavaScript Arrays Crash Course', "It does not matter what project you build you need to understand how to use arrays. In this video I go over the absolute basics of arrays in JavaScript as well as a few other array based features so you can get up and running immediately with arrays.", 'https://img.youtube.com/vi/7W4pQQ20nJg/maxresdefault.jpg', '00:06:03', TRUE, 3, 0, 0, 'Web Dev Simplified', 'https://www.youtube.com/watch?v=7W4pQQ20nJg'),
(12, 'What are Methods in JavaScript', "Defining Function inside the object, It adds behavior to an Object.", 'https://img.youtube.com/vi/4r72b1ScPLY/maxresdefault.jpg', '00:04:40', TRUE, 3, 0, 0, 'Telusko', 'https://www.youtube.com/watch?v=4r72b1ScPLY'),
(13, 'Learn React In 30 Minutes', "In this video I will be covering all of the basics of React in only 30 minutes. We will cover create-react-app, components, state, props, rendering, event handling, and so much more. By the end of this video you will have a full understanding of the basics of React.", 'https://img.youtube.com/vi/hQAHSlTtcmY/maxresdefault.jpg', '00:27:15', TRUE, 2, 0, 0, 'Web Dev Simplified', 'https://www.youtube.com/watch?v=ycrhfkZUKT0'),
(14, 'How to use Axios with React', "Chances are, you will need to make HTTP requests in your web applications. There is numerous options for this, including native browser APIs such as fetch, but Axios is often used when you want more power and extensibility.", 'https://img.youtube.com/vi/oQnojIyTXb8/maxresdefault.jpg', '00:09:34', FALSE, 2, 0, 0, 'Developer.school', 'https://www.youtube.com/watch?v=oQnojIyTXb8'),
(15, 'Full React Tutorial #27 - Controlled Inputs (forms)', "In this React tutorial we will see how to use input fields & track what a user types into them, using controlled inputs.", 'https://img.youtube.com/vi/IkMND33x0qQ/maxresdefault.jpg', '00:09:26', FALSE, 2, 0, 0, 'The Net Ninja', 'https://www.youtube.com/watch?v=IkMND33x0qQ&list=PL4cUxeGkcC9gZD-Tvwfod2gaISzfRiP9d&index=27'),
(16, 'Learn CSS Media Query In 7 Minutes', "Responsive design is one of the most important parts of CSS in the modern web, but it is often overlooked. In this video I will be covering CSS media queries which are the easiest and most common way to create a mobile responsive web site.", 'https://img.youtube.com/vi/yU7jJ3NbPdA/maxresdefault.jpg', '00:07:10', TRUE, 4, 0, 0, 'Web Dev Simplified', 'https://www.youtube.com/watch?v=yU7jJ3NbPdA'),
(17, 'Learn Flexbox CSS in 8 minutes', "During the CSS stone-age developers were creating layouts with floats and positioning until one fateful day Flexbox would be introduced and the world would never be the same.", 'https://img.youtube.com/vi/phWxA89Dy94/maxresdefault.jpg', '00:08:15', TRUE, 4, 0, 0,  'Slaying The Dragon', 'https://www.youtube.com/watch?v=phWxA89Dy94'),
(18, 'Learn CSS Grid - A 13 Minute Deep Dive', "Grids are two dimensional, I can place things on it horizontally, vertically and both simultaneously.", 'https://img.youtube.com/vi/EiNiSFIPIQE/maxresdefault.jpg', '00:13:35', FALSE, 4, 0, 0, 'Slaying The Dragon', 'https://www.youtube.com/watch?v=EiNiSFIPIQE'),
(19, '10 tips CSS PRO - Code this, not that', "Top 10 CSS Pro tips to make your life as a web developer more productive. Some of the best programmers say CSS is too difficult...but you might be surprised how much modern techniques can dramatically improve your code.", 'https://img.youtube.com/vi/Qhaz36TZG5Y/maxresdefault.jpg', '00:09:38', TRUE, 4, 0, 0, 'Fireship', 'https://www.youtube.com/watch?v=Qhaz36TZG5Y'),
(20, 'Semantic versioning and npm', "Packages on NPM should theoretically follow the semantic versioning convention (semver), which is a way to explicitly evolve the version of a given piece of software to minimize incompatibilities and errors.", 'https://img.youtube.com/vi/kK4Meix58R4/maxresdefault.jpg', '00:05:46', FALSE, 5, 0, 0, 'npm', 'https://www.youtube.com/watch?v=kK4Meix58R4'),
(21, 'NPM vs YARN / Which is the best Package Manager ?', "In this video I talk about whether you should use NPM or Yarn as your package manager.", 'https://img.youtube.com/vi/1U_m7mvNz4c/maxresdefault.jpg', '00:03:37', FALSE, 5, 0, 0, 'Clever Programmer', 'https://www.youtube.com/watch?v=0DGClZD5LEM'),
(22, 'Get Started with pnpm', "Pnpm is a replacement for npm or yarn package managers. Because it creates a local store of all packages on your machine and then creates symlinks out to directories that need those packages, it saves your hard drive space and is much quicker than NPM (and often yarn!), especially on reinstalls.", 'https://img.youtube.com/vi/KdHiziZsz7s/maxresdefault.jpg', '00:06:57', FALSE, 5, 0, 0, 'Coding in Public', 'https://www.youtube.com/watch?v=KdHiziZsz7s'),
(23, 'Analysis of an Exploited NPM Package', "Node is npm carries over 210,000 packages from over 60,000 contributors. This wealth of open source functionality is awesome, but it also carries risk.", 'https://img.youtube.com/vi/2cyib2MgvdM/maxresdefault.jpg', '00:24:24', TRUE, 5, 0, 0, 'Coding Tech', 'https://www.youtube.com/watch?v=2cyib2MgvdM'),
(24, 'Node.js Tutorial - Creating a Node Server', "In this video, let is understand with code how to create a node server with the HTTP module", 'https://img.youtube.com/vi/x1cEbRIrOu4/maxresdefault.jpg', '00:07:25', FALSE, 5, 0, 0, 'Codevolution', 'https://www.youtube.com/watch?v=x1cEbRIrOu4&list=PLC3y8-rFHvwh8shCMHFA5kWxD9PaPwxaY&index=32'),
(25, 'Form validation using Javascript on the client side for beginners', "In this video, we will create a client-side form validation using javascript. I will only use vanilla javascript and no external 3rd party dependencies. The aim is to help beginners to do form validation and understand how the whole process works.", 'https://img.youtube.com/vi/CYlNJpltjMM/maxresdefault.jpg', '00:09:35', FALSE, 3, 0, 0, 'JavaScript Academy', 'https://www.youtube.com/watch?v=CYlNJpltjMM'),
(26, 'ReactJS Hooks Update', "Hooks are functions that let you 'hook into' React state and lifecycle features from function components. Hooks don't work inside classes, they let you use React without classes.", 'https://img.youtube.com/vi/oecI26cWqzk/maxresdefault.jpg', '00:03:53', FALSE, 2, 0, 0, 'Codevolution', 'https://www.youtube.com/watch?v=oecI26cWqzk&list=PLC3y8-rFHvwgg3vaYJgHGnModB54rxOk3&index=7'),
(27, 'Should you still LEARN Java in 2023', "Java is one the top programming languages and one the oldest. Should you learn Java. Is Java even relevant?", 'https://img.youtube.com/vi/9yzMKaKcoC0/maxresdefault.jpg', '00:08:15', TRUE, 10, 0, 0, 'Amigoscode', 'https://www.youtube.com/watch?v=9yzMKaKcoC0'),
(28, 'Anatomy of Java Program', "In this video you will learn about Java program anatomy", 'https://img.youtube.com/vi/vsxYucdzimA/maxresdefault.jpg', '00:12:39', TRUE, 10, 0, 0, 'Neso Academy', 'https://www.youtube.com/watch?v=vsxYucdzimA&list=PLBlnK6fEyqRjKA_NuK9mHmlk0dZzuP1P5&index=4'),
(29, 'Configuring our Java Development Environment', "In this video you will learn how to configure your Java development environment", 'https://img.youtube.com/vi/FjGMYpXS9iE/maxresdefault.jpg', '00:04:06', TRUE, 10, 0, 0, 'Neso Academy', 'https://www.youtube.com/watch?v=FjGMYpXS9iE&list=PLBlnK6fEyqRjKA_NuK9mHmlk0dZzuP1P5&index=7'),
(30, 'Creating, Compiling, & Executing a Java Program', "In this video you will learn how to create, compile and execute a Java Program", 'https://img.youtube.com/vi/gHXzyAkbUhk/maxresdefault.jpg', '00:10:24', TRUE, 10, 0, 0, 'Neso Academy', 'https://www.youtube.com/watch?v=gHXzyAkbUhk&list=PLBlnK6fEyqRjKA_NuK9mHmlk0dZzuP1P5&index=8'),
(31, 'Java Packages, Classes, and Methods', "In this video you will learn about Java packages, classes and methods", 'https://img.youtube.com/vi/mgixJYEZ1Fk/maxresdefault.jpg', '00:09:10', True, 10, 0, 0, 'Neso Academy', 'https://www.youtube.com/watch?v=mgixJYEZ1Fk&list=PLBlnK6fEyqRjKA_NuK9mHmlk0dZzuP1P5&index=10'),
(32, 'Full PHP 8 tutorial - Learn PHP the right way in 2023', "If you want to learn PHP the right way, then you are in the right place. In this course, you will learn PHP from beginners level all the way to advanced. ", 'https://img.youtube.com/vi/sVbEyFZKgqk/maxresdefault.jpg', '00:06:59', TRUE, 9, 0, 0, 'Program with Gio', 'https://www.youtube.com/watch?v=sVbEyFZKgqk&list=PLr3d3QYzkw2xabQRUpcZ_IBk9W50M9pe-'),
(33, 'Basic PHP syntax - PHP 8 Tutorial', "Let is write some PHP & go over the basic syntax. After this video, you will be able to concatenate & print text to the browser, declare & use variables, use variables within strings & embed PHP within HTML.", 'https://img.youtube.com/vi/HrtS-FkPBqk/maxresdefault.jpg', '00:12:21', TRUE, 9, 0, 0, 'Program with Gio', 'https://www.youtube.com/watch?v=HrtS-FkPBqk&list=PLr3d3QYzkw2xabQRUpcZ_IBk9W50M9pe-&index=3'), 
(34, 'PHP Data Types - Typecasting overview & how it works - Full PHP 8 Tutorial', "Let is review the data types in PHP & typecasting. PHP does some magic when it comes to handling various data types. It is called type juggling.", 'https://img.youtube.com/vi/KH4MmQsCDuw/maxresdefault.jpg', '00:11:51', FALSE, 9, 0, 0, 'Program with Gio', 'https://www.youtube.com/watch?v=KH4MmQsCDuw&list=PLr3d3QYzkw2xabQRUpcZ_IBk9W50M9pe-&index=5'),
(35, 'PHP Array Data Type - Indexed, Associative & Multi-Dimensional Arrays - Full PHP 8 Tutorial', "In PHP you can have regular index-based arrays also known as indexed arrays, you could also have arrays with custom keys also known as associative arrays & can have arrays within arrays which are called multi-dimensional arrays.", 'https://img.youtube.com/vi/C8ZFLq24g_A/maxresdefault.jpg', '00:16:51', FALSE, 9, 0, 0, 'Program With Gio', 'https://www.youtube.com/watch?v=C8ZFLq24g_A&list=PLr3d3QYzkw2xabQRUpcZ_IBk9W50M9pe-&index=11'),
(36, 'PHP Loops Tutorial - Break & Continue Statements - Full PHP 8 Tutorial', "Loops are simple but there are some important things that you need to be aware of when working with them, such as performance, things to be aware of when working with references, how to break out of nested loops, how to handle infinite loops & so on.", 'https://img.youtube.com/vi/NhXvpHB_PMQ/maxresdefault.jpg', '00:12:23', FALSE, 9, 0, 0, 'Program With Gio', 'https://www.youtube.com/watch?v=NhXvpHB_PMQ&list=PLr3d3QYzkw2xabQRUpcZ_IBk9W50M9pe-&index=17');

-- -----------------------------------------------------
-- Table `origins_digital`.`liked`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `origins_digital`.`liked` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `video_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_liked_video_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_liked_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_liked_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `origins_digital`.`user` (`id`),
  CONSTRAINT `fk_liked_video`
    FOREIGN KEY (`video_id`)
    REFERENCES `origins_digital`.`video` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `origins_digital`.`disliked`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `origins_digital`.`disliked` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `video_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_disliked_video1_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_disliked_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_disliked_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `origins_digital`.`user` (`id`),
  CONSTRAINT `fk_disliked_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `origins_digital`.`video` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `origins_digital`.`favorite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `origins_digital`.`favorite` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  `date_added` DATE NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_has_video_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `origins_digital`.`user` (`id`),
  CONSTRAINT `fk_user_has_video_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `origins_digital`.`video` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `origins_digital`.`recently_viewed`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `origins_digital`.`recently_viewed` (
  `user_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  `video_category_id` INT NOT NULL,
  `video_tags_id` INT NOT NULL,
  `date_viewed` DATE NOT NULL,
  `timer` TIME NOT NULL,
  PRIMARY KEY (`user_id`, `video_id`, `video_category_id`, `video_tags_id`),
  CONSTRAINT `fk_user_has_video_user2`
    FOREIGN KEY (`user_id`)
    REFERENCES `origins_digital`.`user` (`id`),
  CONSTRAINT `fk_user_has_video_video2`
    FOREIGN KEY (`video_id` , `video_category_id`)
    REFERENCES `origins_digital`.`video` (`id` , `category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `origins_digital`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `origins_digital`.`tags` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO `tags` VALUES
(1, 'frontend'),
(2, 'backend'),
(3, 'html'),
(4, 'css'),
(5, 'js'),
(6, 'ts'),
(7, 'php'),
(8, 'sql'),
(9, 'components'),
(10, 'framework'),
(11, 'database'),
(12, 'react'),
(13, 'functions'),
(14, 'nosql'),
(15, 'jsx'),
(16, 'mardiadb'),
(17, 'java'),
(18, 'express'),
(19, 'node'),
(20, 'animation'),
(21, 'input'),
(22, 'authentification'),
(23, 'import'),
(24,'flexbox'),
(25, 'responsive'),
(26, 'variables'),
(27, 'arrays'),
(28, 'conditions'),
(29, 'loops'),
(30, 'dom'),
(31, 'props'),
(32, 'state'),
(33, 'map'),
(34, 'context'),
(35, 'filters'),
(36, 'methods'),
(37, 'scrum'),
(38, 'branch'),
(39, 'flow'),
(40, 'conflicts'),
(41, 'merge'),
(42, 'git'),
(43, 'github'),
(44, 'join'),
(45, 'strings'),
(46, 'debug'),
(47, 'vscode'),
(48, 'mangodb'),
(49, 'routes'),
(50, 'navbar');


-- -----------------------------------------------------
-- Table `origins_digital`.`video_tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `origins_digital`.`video_tags` (
  `video_id` INT NOT NULL,
  `tags_id` INT NOT NULL,
  PRIMARY KEY (`video_id`, `tags_id`),
  CONSTRAINT `fk_video_tags_tags1`
    FOREIGN KEY (`tags_id`)
    REFERENCES `origins_digital`.`tags` (`id`),
  CONSTRAINT `fk_video_tags_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `origins_digital`.`video` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO video_tags VALUES 
(1, 1), (1, 5), (1, 9), (1, 12), (2, 5), (2, 13), (2, 26), (2, 29), (3, 19), (3, 5), (3, 23), (3, 46), (4, 4), (4, 1), (4, 20), (4, 24), (5, 5), (5, 6), (5, 36), (5, 28), (6, 9), (6, 12), (6, 13), (6, 15), (7, 2), (7, 7), (7, 3), (7, 45), (8, 5), (8, 13), (8, 28), (8, 36), (9, 17), (9, 30), (9, 1), (9, 13), (10, 48), (10, 11), (10, 36), (10, 8), (11, 27), (11, 5), (11, 45), (11, 33), (12, 5), (12, 36), (12, 13), (12, 28), (13, 12), (13, 32), (13, 31), (13, 9), (14, 12), (14, 10), (14, 19), (14, 23), (15, 12), (15, 21), (15, 28), (15, 13), (16, 25), (16, 1), (16, 4), (16, 26), (17, 4), (17, 24), (17, 1), (17, 20), (18, 1), (18, 4), (18, 20), (18, 25), (19, 4), (19, 1), (19, 20), (19, 25), (20, 19), (20, 23), (20, 36), (20, 40), (21, 19), (21, 2), (21, 18), (21, 23), (22, 19), (22, 2),  (22, 18),  (22, 23),  (23, 19), (23, 2),  (23, 18),  (23, 23),  (24, 19), (24, 2),  (24, 5),  (24, 23),  (25, 21), (25, 5), (25, 22), (25, 13), (26, 12), (26, 31), (26, 32), (26, 13), (27, 17), (27, 13), (27, 28), (27, 26), (28, 17), (28, 13), (28, 28), (28, 26), (29, 39), (29, 13), (29, 28), (29, 26), (30, 39), (30, 13), (30, 28), (30, 30), (31, 39), (31, 13), (31, 28), (31, 30), (32, 7), (32, 13),(32, 26), (32, 36), (33, 7), (33, 13), (33, 26), (33, 36), (34, 7), (34, 13), (34, 26), (34, 45), (35, 7), (35, 27), (35, 13), (35, 45), (36, 7), (36, 29), (36, 13), (36, 32);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
