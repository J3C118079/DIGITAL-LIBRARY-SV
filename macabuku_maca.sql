-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2022 at 05:14 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `macabuku_maca`
--

-- --------------------------------------------------------

--
-- Table structure for table `bantuans`
--

CREATE TABLE `bantuans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengirim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailAlt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subjek` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pesan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bantuans`
--

INSERT INTO `bantuans` (`id`, `nama`, `pengirim`, `email`, `emailAlt`, `subjek`, `pesan`, `created_at`, `updated_at`) VALUES
(16, 'Daffa', 'Muhammad Daffa Zaky Rahman', 'dzcoc123@gmail.com', 'daffazakyy8@gmail.com', 'Saran website', 'Saran agar website dikembangkan lebih, karena ini website sangat bagus', '2021-05-06 07:38:23', '2021-05-06 07:38:23');

-- --------------------------------------------------------

--
-- Table structure for table `bukus`
--

CREATE TABLE `bukus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penerbit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` enum('Peternakan','Komunikasi','Bisnis & ekonomi','Ekowisata','Tanaman','Perikanan','Komputer & teknologi','Masakan','Industri','Kimia','Lingkungan','Akuntansi','Veteriner','Pertanian','Perkebunan','Masyarakat','Tugas akhir') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penulis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bahasa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempat_terbit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edisi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Tidak tersedia','Tersedia') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bukus`
--

INSERT INTO `bukus` (`id`, `judul`, `slug`, `deskripsi`, `quantity`, `penerbit`, `gambar`, `kategori`, `tahun`, `penulis`, `issn`, `bahasa`, `tempat_terbit`, `volume`, `edisi`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Agile Data Science 2.0', 'agile-data-science-20', 'Data science teams looking to turn research into useful analytics applications require not only the right tools, but also the right approach if they’re to succeed. With the revised second edition of this hands-on guide, up-and-coming data scientists will learn how to use the Agile Data Science development methodology to build data applications with Python, Apache Spark, Kafka, and other tools. Author Russell Jurney demonstrates how to compose a data platform for building, deploying, and refining analytics applications with Apache Kafka, MongoDB, ElasticSearch, d3.js, scikit-learn, and Apache Airflow. You’ll learn an iterative approach that lets you quickly change the kind of analysis you’re doing, depending on what the data is telling you. Publish data science work as a web application, and affect meaningful change in your organization.', '5', 'Gramedia Pustaka Utama', '1617886636_agile data science.jpg', 'Komputer & teknologi', '2017', 'Russel Jurney', NULL, 'Inggris', NULL, NULL, NULL, 'Tersedia', '2021-03-31 10:39:10', '2021-12-05 06:34:57', NULL),
(5, 'The Art of Data Science - A Guide for Anyone Who Works With Data', 'the-art-of-data-science-a-guide-for-anyone-who-works-with-data', 'This book describes, simply and in general terms, the process of analyzing data. The authors have ex tensive experience both managing data analysts and conducting their own data analyses, and have carefully observed what produces coherent results and what fails to produce useful insights into data. This book is a distillation of their experience in a format that is applicable to both practitioners and managers in data science.', '12', 'Packt Publishing Ltd.', '1617886626_the art of data science.jpg', 'Komputer & teknologi', '2015', 'Roger D. Peng and Elizabeth Matsui', NULL, 'Inggris', NULL, NULL, NULL, 'Tersedia', '2021-03-31 10:52:49', '2021-11-18 17:44:29', NULL),
(6, 'Introduction To Data Science', 'introduction-to-data-science', 'In this era, where a huge amount of information from different fields is gathered and stored, its a nalysis and the extraction of value have become one of the most attractive tasks for companies and society in general. The design of solutions for the new questions emerged from data has required multidisciplinary teams. Computer scientists, statisticians, mathematicians, biologists, journalists and sociologists, as well as many others are now working together in order to provide knowledge from data. This new interdisciplinary field is called data science. The pipeline of any data science goes through asking the right questions, gathering data, cleaning data, generating hypothesis, making inferences, visualizing data, assessing solutions, etc.', '0', 'Springer International Publishing Switzerland', '1617886612_Introduction To Data Science.jpg', 'Komputer & teknologi', '2016', 'Laura Igual & Santi Segui', NULL, 'Inggris', NULL, NULL, NULL, 'Tersedia', '2021-03-31 10:56:20', '2021-09-22 01:24:15', NULL),
(7, 'Docker For Data Science', 'docker-for-data-science', 'Learn Docker \"infrastructure as code\" technology to define a system for performing standard but non- trivial data tasks on medium- to large-scale data sets, using Jupyter as the master controller. It is not uncommon for a real-world data set to fail to be easily managed. The set may not fit well into access memory or may require prohibitively long processing. These are significant challenges to skilled software engineers and they can render the standard Jupyter system unusable.', '7', 'Apress', '1617886601_Docker for data science.jpg', 'Komputer & teknologi', '2018', 'Joshua Cook', NULL, 'Inggris', NULL, NULL, NULL, 'Tersedia', '2021-03-31 10:57:41', '2021-09-21 09:41:46', NULL),
(15, 'Deep Learning with Python.', 'deep-learning-with-python', 'Deep Learning with Python introduces the field of deep learning using the Python language and the powerful Keras library. Written by Keras creator and Google AI researcher François Chollet, this book builds your understanding through intuitive explanations and practical examples.\r\n\r\nMachine learning has made remarkable progress in recent years. We went from near-unusable speech and image recognition, to near-human accuracy. We went from machines that couldn\'t beat a serious Go player, to defeating a world champion. Behind this progress is deep learning—a combination of engineering advances, best practices, and theory that enables a wealth of previously impossible smart applications.', '5', 'Manning Publications', '1620808887_2017 Deep Learning with Python.jpg', 'Komputer & teknologi', '2017', 'François Chollet', NULL, 'Inggris', 'Shelters Island', NULL, NULL, 'Tersedia', '2021-05-12 08:41:27', '2021-11-22 04:32:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `civitas`
--

CREATE TABLE `civitas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` enum('Admin','Dosen','Mahasiswa Akhir','Mahasiswa') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `civitas`
--

INSERT INTO `civitas` (`id`, `nama`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, '2021-03-30 08:13:44', '2021-03-30 08:13:44'),
(2, 'Dosen', NULL, '2021-03-30 08:13:44', '2021-03-30 08:13:44'),
(3, 'Mahasiswa Akhir', NULL, '2021-03-30 08:13:44', '2021-03-30 08:13:44'),
(4, 'Mahasiswa', NULL, '2021-03-30 08:13:44', '2021-03-30 08:13:44');

-- --------------------------------------------------------

--
-- Table structure for table `ebooks`
--

CREATE TABLE `ebooks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `penerbit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategori` enum('Peternakan','Komunikasi','Bisnis & ekonomi','Ekowisata','Tanaman','Perikanan','Komputer & teknologi','Masakan','Industri','Kimia','Lingkungan','Akuntansi','Paramedik','Pertanian','Perkebunan','Masyarakat','Tugas akhir','Jurnal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penulis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bahasa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempat_terbit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edisi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ebooks`
--

INSERT INTO `ebooks` (`id`, `judul`, `slug`, `deskripsi`, `penerbit`, `gambar`, `kategori`, `tahun`, `penulis`, `issn`, `bahasa`, `tempat_terbit`, `volume`, `edisi`, `pdf`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Data Science For Dummies', 'data-science-for-dummies', 'Discover how data science can help you gain in-depth insight into your business – the easy way!\r\n\r\nJobs in data science abound, but few people have the data science skills needed to fill these increasingly important roles. Data Science For Dummies is the perfect starting point for IT professionals and students who want a quick primer covering all areas of the expansive data science space. With a focus on business cases, the book explores topics in big data, data science, and data engineering, and how these three areas are combined to produce tremendous value. If you want to pick-up the skills you need to begin a new career or initiate a new project, reading this book will help you understand what technologies, programming languages, and mathematical methods on which to focus. While this book serves as a wildly fantastic guide through the broad aspects of the topic, including the sometimes intimidating field of big data and data science, it is not an instructional manual for hands-on implementation. Here’s what to expect in Data Science for Dummies:\r\n\r\nProvides a background in big data and data engineering before moving on to data science and how it’s applied to generate value.\r\nIncludes coverage of big data frameworks and applications like Hadoop, MapReduce, Spark, MPP platforms, and NoSQL.\r\nExplains machine learning and many of its algorithms, as well as artificial intelligence and the evolution of the Internet of Things.\r\nDetails data visualization techniques that can be used to showcase, summarize, and communicate the data insights you generate.\r\nIt’s a big, big data world out there – let Data Science For Dummies help you get started harnessing its power so you can gain a competitive edge for your organization.', 'John Wiley & Sons, Inc.', '1617888590_data science for dummies.jpg', 'Komputer & teknologi', '2015', 'Lilian Pierson', '978‐1‐118‐84152‐5', 'Inggris', 'Canada', NULL, NULL, '1617888590_2015 Data Science For_Dummies.pdf', '2021-03-31 06:09:01', '2021-04-08 13:29:51', NULL),
(6, 'Introduction To Data Science', 'introduction-to-data-science', 'In this era, where a huge amount of information from different fields is gathered and\r\nstored, its analysis and the extraction of value have become one of the most\r\nattractive tasks for companies and society in general. The design of solutions for the\r\nnew questions emerged from data has required multidisciplinary teams. Computer\r\nscientists, statisticians, mathematicians, biologists, journalists and sociologists, as\r\nwell as many others are now working together in order to provide knowledge from\r\ndata. This new interdisciplinary field is called data science.\r\nThe pipeline of any data science goes through asking the right questions,\r\ngathering data, cleaning data, generating hypothesis, making inferences, visualizing\r\ndata, assessing solutions, etc.', 'Springer International Publishing Switzerland', '1617888498_Introduction To Data Science.jpg', 'Komputer & teknologi', '2017', 'Laura Igual & Santi Segui', '2197-1781', 'Inggris', 'Switzerland', NULL, NULL, '1617888498_2016 Introducing Data Science.pdf', '2021-03-31 06:48:40', '2021-04-08 13:28:19', NULL),
(8, 'Docker For Data Science', 'docker-for-data-science', 'Learn Docker \"infrastructure as code\" technology to define a system for performing standard but non-trivial data tasks on medium- to large-scale data sets, using Jupyter as the master controller.\r\n\r\nIt is not uncommon for a real-world data set to fail to be easily managed. The set may not fit well into access memory or may require prohibitively long processing. These are significant challenges to skilled software engineers and they can render the standard Jupyter system unusable.', 'Apress', '1617888694_Docker for data science.jpg', 'Komputer & teknologi', '2018', 'Joshua Cook', '978-1-4842-3012-1', 'Inggris', 'California', NULL, NULL, '1617888694_2018 Docker for Data Science.pdf', '2021-03-31 07:03:18', '2021-04-08 13:31:34', NULL),
(9, 'Practical Data Science', 'practical-data-science', 'The data science technology stack demonstrated in Practical Data Science is built from components in general use in the industry. Data scientist Andreas Vermeulen demonstrates in detail how to build and provision a technology stack to yield repeatable results. He shows you how to apply practical methods to extract actionable business knowledge from data lakes consisting of data from a polyglot of data types and dimensions.', 'Apress', '1617888768_Practical data science.jpg', 'Komputer & teknologi', '2018', 'Andreas François Vermeulen', '978-1484230534', 'Inggris', NULL, NULL, NULL, '1617888768_2018 Practical Data Science.pdf', '2021-03-31 07:06:48', '2021-04-08 13:32:48', NULL),
(10, 'Python Data Analysis', 'python-data-analysis', 'Learn how to apply powerful data analysis techniques \r\nwith popular open source Python modules', 'Packt Publishing Ltd.', '1617888814_python data analysis.jpg', 'Komputer & teknologi', '2014', 'Ivan Idris', '978-1-78355-335-8', 'Inggris', 'Livery Place, 35 Livery Street, Birmingham B3 2PB, UK.', NULL, NULL, '1617888814_2014 Python Data Analysis.pdf', '2021-03-31 07:14:33', '2021-04-08 13:33:34', NULL),
(12, 'Agile Data Science 2.0', 'agile-data-science-20', 'Data science teams looking to turn research into useful analytics applications require not only the right tools, but also the right approach if they’re to succeed. With the revised second edition of this hands-on guide, up-and-coming data scientists will learn how to use the Agile Data Science development methodology to build data applications with Python, Apache Spark, Kafka, and other tools.\r\n\r\nAuthor Russell Jurney demonstrates how to compose a data platform for building, deploying, and refining analytics applications with Apache Kafka, MongoDB, ElasticSearch, d3.js, scikit-learn, and Apache Airflow. You’ll learn an iterative approach that lets you quickly change the kind of analysis you’re doing, depending on what the data is telling you. Publish data science work as a web application, and affect meaningful change in your organization.', 'O\'Reilly Media', '1617888347_agile data science.jpg', 'Komputer & teknologi', '2017', 'Russel Jurney', '978-1-491-96011-0', 'Inggris', NULL, NULL, NULL, '1617888347_2017 Agile Data Science 2.0.pdf', '2021-03-31 07:23:33', '2021-04-08 13:25:47', NULL),
(13, 'Data Science For Practice', 'data-science-in-practice', 'This book approaches big data, artificial intelligence, machine learning, and business intelligence through the lens of Data Science. We have grown accustomed to seeing these terms mentioned time and time again in the mainstream media. However, our understanding of what they actually mean often remains limited. This book provides a general overview of the terms and approaches used broadly in data science, and provides detailed information on the underlying theories, models, and application scenarios. Divided into three main parts, it addresses what data science is; how and where it is used; and how it can be implemented using modern open source software. The book offers an essential guide to modern data science for all students, practitioners, developers and managers seeking a deeper understanding of how various aspects of data science work, and of how they can be employed to gain a competitive advantage.', 'Springer', '1617888289_data science for practice.jpg', 'Komputer & teknologi', '2019', 'Alan Said & Vicenç Torra', '2197-6511', 'Inggris', NULL, NULL, NULL, '1617888289_2019 Data Science in Practice.pdf', '2021-03-31 07:34:07', '2021-04-08 13:24:49', NULL),
(14, 'Practical Python Data Visualization', 'practical-python-data-visualization', 'Quickly start programming with Python 3 for data visualization with this step-by-step, detailed guide. This book’s programming-friendly approach using libraries such as leather, NumPy, Matplotlib, and Pandas will serve as a template for business and scientific visualizations.\r\n\r\nYou’ll begin by installing Python 3, see how to work in Jupyter notebook, and explore Leather, Python’s popular data visualization charting library. You’ll also be introduced to the scientific Python 3 ecosystem and work with the basics of NumPy, an integral part of that ecosystem. Later chapters are focused on various NumPy routines along with getting started with Scientific Data visualization using matplotlib. You’ll review the visualization of 3D data using graphs and networks and finish up by looking at data visualization with Pandas, including the visualization of COVID-19 data sets.', 'Apress', '1617888641_Practical Python Data Visualization.jpg', 'Komputer & teknologi', '2021', 'Pajankar & Ashwin', NULL, 'Inggris', NULL, NULL, NULL, '1617888641_sesi 22 2021 Practical Python Data Visualization A Fast Track Approach To Learning Data Visualization With Python .pdf', '2021-03-31 07:42:26', '2021-04-08 13:30:41', NULL),
(15, 'Pengaruh Warna, Tipografi, dan Layout Pada Desain Situs', 'pengaruh-warna-tipografi-dan-layout-pada-desain-situs', 'Dunia maya saat ini menjadi andalan banyak orang dalam mempromosikan diri, barang, ataupun \r\norganisasi mereka. Apa yang ditampilkan di dunia maya tidak lepas dari peranan sebuah desain situs yang \r\nmenarik dan mengajak pengunjung untuk membaca dan memahami pesan yang pemilik situs ingin sampaikan. \r\nDesain situs yang menarik tidak hanya dari segi isinya saja yang lengkap tetapi juga dari segi penampilannya. \r\nArtikel ini menjelaskan pemilihan warna yang baik untuk sebuah situs, penerapan tipografi untuk memudahkan \r\npengunjung dalam membaca isi situs, dan pengolahan layout yang sesuai dengan prinsip desain agar desain \r\nsebuah situs tertata dengan baik.\r\n\r\nKata kunci: layout, warna, tipografi, desain situs', 'Bina Nusantara University', 'jurnal.PNG', 'Jurnal', '2010', 'Monica', NULL, 'Indonesia', NULL, NULL, NULL, '1619679984_167092-ID-pengaruh-warna-tipografi-dan-layout-pada.pdf', '2021-03-31 08:55:12', '2021-04-29 07:06:24', NULL),
(16, 'Peranan Web Desain Dalam Internet', 'peranan-web-desain-dalam-internet', 'Internet adalah suatu media alternatif yang sudah menjadi tren, gaya hidup serta kebutuhan bagi \r\nmasyarakat di dunia. Sedangkan tampilan antarmuka (interface) sebuah website sudah semakin hari semakin \r\nindah, menarik dan canggih. Itulah sebabnya web desain menyajikan tampilan visual sebuah website yang \r\nmemiliki pesan tertentu yang meliputi layout, elemen grafis, hingga sistem navigasi yang memudahkan \r\npengguna dalam menjelajah sebuah website. Saat ini, sebuah website sudah menunjukkan identitas sebuah \r\nproduk, perusahaan hingga pemilik website tersebut. Dalam menghadapi persaingan global yang kian ketat, \r\nweb desain memiliki peranan penting dalam mengungguli kompetitor lain. \r\n\r\nKata kunci: internet, situs web, web desain', 'Bina Nusantara University', 'jurnal.PNG', 'Jurnal', '2010', 'D. Nunnun Bonafix', NULL, 'Indonesia', NULL, NULL, NULL, '1619679969_167307-ID-peranan-web-desain-dalam-internet.pdf', '2021-03-31 08:59:33', '2021-04-29 07:06:09', NULL),
(17, 'Perancangan User Interface E-Learning Berbasis Web', 'perancangan-user-interface-e-learning-berbasis-web', 'e-Learning steadily growing and the ongoing struggle to convince the skeptics of the potential of e-Learning and \r\nonline virtual classrooms, quality design is the foundation for a successful distance learning program. The \r\ndesign of the instruction and the design of the user interface are critical elements in providing quality education \r\nwith a virtual, e-Learning model. This White Paper will focus on the design of the e-Learning user interface \r\n(UI). This paper provides examples of user interface design from e-Learning prototype. \r\n\r\nKeyword : e-Learning, user interface design', 'UPN ”Veteran” Yogyakarta, 24 Mei 2008', 'jurnal.PNG', 'Jurnal', '2008', 'Bernard Renaldy Suteja, Agus Harjoko', '1979-2328', 'Indonesia', NULL, NULL, NULL, '1619679938_174008-ID-perancangan-user-interface-e-learning-be.pdf', '2021-03-31 09:07:12', '2021-04-29 07:05:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorit_ebooks`
--

CREATE TABLE `favorit_ebooks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ebook_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorit_ebooks`
--

INSERT INTO `favorit_ebooks` (`id`, `status`, `user_id`, `ebook_id`, `created_at`, `updated_at`) VALUES
(7, '0', 1, 2, '2021-04-06 09:37:34', '2021-11-17 09:11:50'),
(8, '0', 1, 16, '2021-04-06 13:12:12', '2021-04-06 13:12:17'),
(9, '1', 1, 17, '2021-04-08 13:22:51', '2021-11-16 11:06:56'),
(10, '0', 1, 15, '2021-04-15 02:37:42', '2021-05-16 14:42:50'),
(11, '0', 1, 12, '2021-04-15 02:40:35', '2021-07-18 09:23:58'),
(12, '1', 12, 8, '2021-05-03 08:04:02', '2021-05-03 08:04:47'),
(13, '0', 1, 9, '2021-05-06 07:33:51', '2021-05-06 07:33:53'),
(14, '0', 1, 14, '2021-05-08 06:17:11', '2021-07-26 02:33:42'),
(15, '0', 1, 6, '2021-05-08 06:28:14', '2021-05-27 23:40:33'),
(16, '1', 52, 12, '2021-06-21 04:02:43', '2021-06-21 04:02:43'),
(17, '0', 60, 2, '2021-06-21 04:20:43', '2021-06-21 04:20:59'),
(18, '1', 67, 13, '2021-06-21 05:12:13', '2021-06-21 05:12:13'),
(19, '1', 68, 2, '2021-06-21 05:15:12', '2021-06-21 05:15:12'),
(20, '1', 68, 6, '2021-06-21 05:22:49', '2021-06-21 05:22:49'),
(21, '1', 68, 8, '2021-06-21 05:23:02', '2021-06-21 05:23:02'),
(22, '1', 72, 17, '2021-06-21 05:43:32', '2021-06-21 05:43:32'),
(23, '1', 65, 15, '2021-06-21 08:07:16', '2021-06-21 08:07:16'),
(24, '1', 57, 14, '2021-06-29 03:35:30', '2021-06-29 03:35:30'),
(25, '0', 1, 8, '2021-07-18 04:53:00', '2021-07-18 09:24:08'),
(26, '0', 57, 17, '2021-07-23 12:06:10', '2021-07-24 05:49:12'),
(27, '1', 57, 13, '2021-07-25 16:14:38', '2021-07-25 16:14:38'),
(28, '1', 57, 12, '2021-07-26 05:42:13', '2021-07-26 05:42:13'),
(29, '0', 1, 13, '2021-09-08 11:42:31', '2021-09-08 11:42:42'),
(30, '1', 86, 14, '2021-11-18 17:47:20', '2021-11-18 17:47:20'),
(31, '0', 87, 8, '2021-11-21 09:14:15', '2021-11-21 09:14:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_02_02_092018_create_civitas_table', 1),
(5, '2021_02_02_093003_create_bukus_table', 1),
(6, '2021_02_02_093359_create_peminjamen_table', 1),
(7, '2021_02_04_144155_create_ebooks_table', 1),
(8, '2021_02_05_075824_create_request_tables', 1),
(9, '2021_03_19_131751_create_bantuans_table', 1),
(10, '2021_03_29_154849_create_favorit_ebooks_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('rizkyaquino55@gmail.com', '$2y$10$oGsJ7kRjXKeYFvQkb4TW2uESmp.Wey5skkp1CHeRjoQ3JOqam7myK', '2021-05-05 07:47:40'),
('freeforrazer@gmail.com', '$2y$10$YYM97jMQiQL/tbXjsT6us.CI9GE2ApFk25ErinwEbwfynNaonY7xC', '2021-11-17 09:30:06');

-- --------------------------------------------------------

--
-- Table structure for table `peminjamen`
--

CREATE TABLE `peminjamen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `civitas_id` bigint(20) UNSIGNED NOT NULL,
  `buku_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Pinjam','Dikembalikan','Denda','Booking') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pinjam',
  `allowed` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lastreturn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `peminjamen`
--

INSERT INTO `peminjamen` (`id`, `civitas_id`, `buku_id`, `user_id`, `status`, `allowed`, `deleted_at`, `created_at`, `updated_at`, `lastreturn`) VALUES
(78, 1, 15, 1, 'Dikembalikan', '1', NULL, '2021-11-22 04:32:52', '2022-01-25 02:29:02', '2022-01-31 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `request_tables`
--

CREATE TABLE `request_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `requester` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `requesting` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `request_tables`
--

INSERT INTO `request_tables` (`id`, `requester`, `user_id`, `requesting`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(20, 'Admin', 1, '1', '1', NULL, '2022-01-25 04:10:04', '2022-01-25 04:10:16');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sbp`
--

CREATE TABLE `tbl_sbp` (
  `nomor_sbp` int(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sbp`
--

INSERT INTO `tbl_sbp` (`nomor_sbp`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prodi` enum('Komunikasi','Ekowisata','Manajemen Informatika','Teknik Komputer','Supervisor Jaminan Mutu Pangan','Manajemen Industri Jasa Makanan dan Gizi','Teknologi Industri Benih','Teknologi Produksi dan Manajemen Perikanan Budidaya','Teknologi dan Manajemen Ternak','Manajemen Agribisnis','Manajemen Industri','Analisis Kimia','Teknik dan Manajemen Lingkungan','Akuntansi','Paramedik Veteriner','Teknologi Produksi dan Manajemen Perkebunan','Teknologi Produksi dan Pengembangan Masyarakat Pertanian') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `civitas_id` bigint(20) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `nim`, `email`, `prodi`, `email_verified_at`, `password`, `username`, `status`, `civitas_id`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'J3C118124', 'admin@maca.com', 'Manajemen Informatika', '2021-03-30 09:34:14', '$2y$10$oLqF/Zi1oK3nclK6z7XzJuqsAUpiy7BG.eAcucxwlmb.M1zAT5fMG', 'admin', '1', 1, NULL, NULL, '2021-03-30 08:13:44', '2021-03-30 08:13:44'),
(5, 'Salsabila Mayada Subagya', 'J3C118065', 'salsabila_mayada@apps.ipb.co.id', 'Manajemen Informatika', '2021-04-05 03:59:23', '$2y$10$ZnUDvmrviKpN7q6wItcX9eEp3xdPhPg7bKXapRfiujqCIP/xZjQqS', 'salsabila_mayada', '1', 3, NULL, NULL, '2021-04-05 03:59:13', '2021-04-05 03:59:23'),
(7, 'Dherby Akbar Ramadhan', 'J3C118079', 'dherby_akbarr22@apps.ipb.ac.id', 'Manajemen Informatika', '2021-04-16 12:10:37', '$2y$10$LlnVlxAM.6neCRJ4CCB4xuLNqztJEMfiz/qJ8aESbl/0q7mJzNuJy', 'dherby_akbarr22', '1', 3, NULL, NULL, '2021-04-16 12:09:32', '2021-04-16 12:10:37'),
(12, 'Ikhwan Tris', 'J3C918983', 'Ikhwantris@gmail.com', 'Manajemen Informatika', '2021-05-03 07:59:55', '$2y$10$GyADEJ0SbmaxKggDZQE4PuvtKnQ4Vx7pcmAEWCc40I30BiGJFfy6a', 'Ikhwantris', '1', 3, NULL, NULL, '2021-05-03 07:58:51', '2021-05-03 07:59:55'),
(15, 'Muhammad Avicenna', 'J3C218177', 'avicenna_333@apps.ipb.ac.id', 'Manajemen Informatika', '2021-05-04 10:11:01', '$2y$10$JXnb4H0vmkdznKZb4EOGyOkuJLBGSzsGbveh2chaoyCWoJCWdsbc.', 'avicenna_333', '1', 3, NULL, NULL, '2021-05-04 10:10:49', '2021-05-04 10:11:01'),
(16, 'Ichlasul Ichsan', 'J3C118146', 'ichlasul.ichsan@apps.ipb.ac.id', 'Manajemen Informatika', '2021-05-05 11:47:19', '$2y$10$rFU/TuxD5H0VXjLoJvsOkO3Qg4PhJkYm0ryf2AMuWcd92UTkbjVBm', 'ichlasul.ichsan', '1', 3, NULL, NULL, '2021-05-05 11:46:04', '2021-05-05 11:47:19'),
(18, 'Abdul Latif Wicaksono', 'J3C218183', 'abdul_latifw@apps.ipb.ac.id', 'Manajemen Informatika', '2021-05-05 11:57:24', '$2y$10$9VYzc6SpWjI8qWlUF6oFVeULEM6zgTiovGb0SMaYpXxdxDAvDc49q', 'abdul_latifw', '1', 3, NULL, NULL, '2021-05-05 11:56:56', '2021-05-05 11:57:24'),
(40, 'Munadi Lil Iman', 'J3C118068', 'munadi@gmail.com', 'Manajemen Informatika', '2021-05-17 02:29:54', '$2y$10$rTTH4eWHqT0cRUDMNtH.Cu9K1ZgFrxncdefpAYz.vairZrVQFpL0O', 'munadi', '1', 3, NULL, NULL, '2021-05-17 00:43:47', '2021-05-17 00:44:16'),
(52, 'Maria Widhi Astuti', 'J3C118047', 'mariawidhi26@gmail.com', 'Manajemen Informatika', '2021-06-21 03:56:53', '$2y$10$XH/RAyjEPxFRAyUqRWDFr.in3v5KqvyZ8jFKzSzgmmYFgfctaJvnq', 'mariawidhi26', '1', 3, NULL, NULL, '2021-06-21 03:56:43', '2021-06-21 03:56:53'),
(57, 'Rizky Aquino', 'J3C118074', 'rizky_ino@apps.ipb.ac.id', 'Manajemen Informatika', '2021-06-21 04:12:14', '$2y$10$tpyzyGKBwNx9zBquEQ2pluHVwnFQDJN7qvVWWFvy8Kp8js4sLZ0Mq', 'rizky_ino', '1', 3, NULL, NULL, '2021-06-21 04:11:56', '2021-06-21 04:12:14'),
(58, 'fachry arrasyid', 'J3C218186', 'fachry.arrasyid53@gmail.com', 'Manajemen Informatika', '2021-06-21 04:12:55', '$2y$10$5HjXb0AfUWORUlUZwuyG6uzhIJu8vKSTfyfcKv6qLdkXTzQs61CJq', 'fachry.arrasyid53', '1', 3, NULL, NULL, '2021-06-21 04:12:21', '2021-06-21 04:12:55'),
(59, 'Alan Raihan Maulana', 'J3C118094', 'alan_ipb@apps.ipb.ac.id', 'Manajemen Informatika', '2021-06-21 04:14:01', '$2y$10$1Sd2GHEXGoduYVoQ/DyrFu7hMN7Wy/1Izz6VNTq/YgCFH3pwGNuIO', 'alan_ipb', '1', 3, NULL, NULL, '2021-06-21 04:13:54', '2021-06-21 04:14:01'),
(60, 'Nabila Fakhiratunisa', 'J3C118135', 'nabila_fakhira11@apps.ipb.ac.id', 'Manajemen Informatika', '2021-06-21 04:15:56', '$2y$10$g2NLwbS9dcNcqb8sbH.Irep/N56298jUnagq9bQKHYPbTYOW678bq', 'nabila_fakhira11', '1', 3, NULL, NULL, '2021-06-21 04:15:23', '2021-06-21 04:15:55'),
(64, 'Merry Ardelia Wirastuti', 'J3C118033', 'merry_2605@apps.ipb.ac.id', 'Manajemen Informatika', '2021-06-21 05:02:02', '$2y$10$hPRLSoFfrWmmxYyxX6cLEOXaVzznAAbi5.PnksrqS0/FKS5uK9pFS', 'merry_2605', '1', 3, NULL, NULL, '2021-06-21 05:00:38', '2021-06-21 05:02:02'),
(65, 'Kuple', 'J3A118101', 'kuple@apps.ipb.ac.id', 'Komunikasi', '2021-06-23 03:15:00', '$2y$10$5dZkh721YvYwjZZspTCSX.HUsa0rGBzHCZglRPE0816XoUSLmbmQW', 'kuple', '1', 4, NULL, NULL, '2021-06-21 05:03:49', '2021-06-21 05:04:19'),
(66, 'Wulan Muliawati', 'J3C118039', 'wulan_muliawati@apps.ipb.ac.id', 'Manajemen Informatika', '2021-06-21 05:07:29', '$2y$10$N1SGsFAAIwPdLiS//9FjEeRT02vqekJm8x7g6IjFy8PYFhOuBdSD.', 'wulan_muliawati', '1', 3, NULL, NULL, '2021-06-21 05:07:04', '2021-06-21 05:07:29'),
(67, 'Iqsal Gafhari', 'J3C218193', 'iqsal_gafhari@apps.ipb.ac.id', 'Manajemen Informatika', '2021-06-21 05:10:50', '$2y$10$Tvfsez.P4whVuCqBU5SVxueJ2yOl3KvxUKfaJm/37XoDyMidk/sri', 'iqsal_gafhari', '1', 3, NULL, NULL, '2021-06-21 05:10:27', '2021-06-21 05:10:50'),
(68, 'Alif', 'J3C118102', 'alif_mh9@apps.ipb.ac.id', 'Manajemen Informatika', '2021-06-21 05:12:51', '$2y$10$R8SREcfpxeuYdliO67e.sOy8uREQmlcSut5NWYj9nRkNX8a.TdWDq', 'alif_mh9', '1', 3, NULL, NULL, '2021-06-21 05:12:07', '2021-06-21 05:12:51'),
(69, 'Mochammad Wijdan Ramadhan', 'J3C118051', 'ramadhan_1999@apps.ipb.ac.id', 'Manajemen Informatika', '2021-06-21 05:16:01', '$2y$10$U/P.CjZMB6.y5b7V2QugbOtb/dDbtPix7zlpvJhpgCG4SFeH2pZlm', 'ramadhan_1999', '1', 3, NULL, NULL, '2021-06-21 05:14:17', '2021-06-21 05:16:01'),
(70, 'REVAL FAHMI AZIZ', 'J3C218197', 'reval_27@apps.ipb.ac.id', 'Manajemen Informatika', '2021-06-21 05:27:47', '$2y$10$rcBC2ArdFv.uYsOPWQOfKu/okFDQvrykUdd45s1YWFoZVKkcgytVS', 'reval_27', '1', 3, NULL, NULL, '2021-06-21 05:23:11', '2021-06-21 05:27:47'),
(71, 'Ayu Vadia Putri', 'J3C118120', 'ayuvadiaptr@gmail.com', 'Manajemen Informatika', '2021-06-21 05:27:44', '$2y$10$ZsgX40g93DeLZjxmVKV.0OpQLaCAlaSAi.DGr2DMGFcWPgPCmDo.K', 'ayuvadiaptr', '1', 3, NULL, NULL, '2021-06-21 05:26:39', '2021-06-21 05:27:44'),
(72, 'Haidar Ahmad Fadhil', 'J3C118099', 'haidar_ahmad@apps.ipb.ac.id', 'Manajemen Informatika', '2021-06-21 05:38:41', '$2y$10$okKCbmdZewoeVzwCPnC4Au6rWlVckZ96zNsFN1SPGkBA1kzlE.OCy', 'haidar_ahmad', '1', 3, NULL, NULL, '2021-06-21 05:36:10', '2021-06-21 05:38:41'),
(73, 'Muhammad Surya Adi', 'J3C118019', 'muhammadsuryaadit@gmail.com', 'Manajemen Informatika', '2021-06-21 06:10:54', '$2y$10$44vCqj472yP2/LoeGxWJTehLjTHQQwVrlIbM2dn6QbZLcc0XuPumm', 'muhammadsuryaadit', '1', 3, NULL, NULL, '2021-06-21 06:07:48', '2021-06-21 06:10:54'),
(74, 'Enrico Timothy Rezmana Kaban', 'J3C118005', 'enrico_kaban@apps.ipb.ac.id', 'Manajemen Informatika', '2021-06-21 06:23:39', '$2y$10$7K/6uetMHW6xAKPYrHu83O7VJM0zwrBngBB79BfARqPFSfD6wN9xG', 'enrico_kaban', '1', 3, NULL, NULL, '2021-06-21 06:18:12', '2021-06-21 06:23:39'),
(75, 'Daniel Tulus Parsaoran Simamora', 'J3C118008', 'daniel_simamora@apps.ipb.ac.id', 'Manajemen Informatika', '2021-06-21 09:09:08', '$2y$10$XP4k/PHk6rX0/aFgL6GKie0OI75m9/xxQ2nMotkCS4kjycr/xFWDa', 'daniel_simamora', '1', 3, NULL, NULL, '2021-06-21 07:32:09', '2021-06-21 09:09:08'),
(83, 'Eklesias Fressdiarin', 'J3C218079', 'arin18@apps.ipb.ac.id', 'Komunikasi', '2021-11-21 05:57:38', '$2y$10$Lla8iX2zFq/fa7DHykMjL.YIOaSle2yr3CguXnsHUFwkTyifSA5Um', 'arin18', '1', 3, NULL, NULL, '2021-09-21 09:39:19', '2021-09-21 09:39:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bantuans`
--
ALTER TABLE `bantuans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bukus`
--
ALTER TABLE `bukus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `civitas`
--
ALTER TABLE `civitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ebooks`
--
ALTER TABLE `ebooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorit_ebooks`
--
ALTER TABLE `favorit_ebooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `peminjamen`
--
ALTER TABLE `peminjamen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_tables`
--
ALTER TABLE `request_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bantuans`
--
ALTER TABLE `bantuans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `bukus`
--
ALTER TABLE `bukus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `civitas`
--
ALTER TABLE `civitas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ebooks`
--
ALTER TABLE `ebooks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorit_ebooks`
--
ALTER TABLE `favorit_ebooks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `peminjamen`
--
ALTER TABLE `peminjamen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `request_tables`
--
ALTER TABLE `request_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
