-- phpMyAdmin SQL Dump
-- version 5.2.0-rc1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 28 mars 2022 à 06:16
-- Version du serveur : 5.7.33
-- Version de PHP : 8.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1205, 'nihil'),
(1206, 'rem'),
(1207, 'maxime');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220321142346', '2022-03-21 14:24:38', 184),
('DoctrineMigrations\\Version20220321143542', '2022-03-21 14:35:47', 89),
('DoctrineMigrations\\Version20220321145311', '2022-03-21 14:53:16', 92),
('DoctrineMigrations\\Version20220323113039', '2022-03-23 11:30:50', 147),
('DoctrineMigrations\\Version20220324092526', '2022-03-24 09:25:40', 192),
('DoctrineMigrations\\Version20220324100014', '2022-03-24 10:00:26', 320),
('DoctrineMigrations\\Version20220324101141', '2022-03-24 10:11:47', 135),
('DoctrineMigrations\\Version20220324101827', '2022-03-24 10:18:35', 125);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `content`, `title`, `image`, `date`, `user_id`, `slug`) VALUES
(614, 'Quam aut reiciendis aspernatur. Voluptatibus sit ea consequatur error impedit est aliquam. Quis est ea veniam aut soluta.', 'Occaecati ut molestiae voluptatem possimus fugiat.', 'https://picsum.photos/id/1037/800/600', '1993-07-23 14:55:20', 606, 'occaecati-ut-molestiae-voluptatem-possimus-fugiat'),
(615, 'Esse illo architecto minima laboriosam iure aspernatur in. Eos eligendi mollitia eveniet accusantium excepturi animi neque. Possimus debitis reprehenderit sapiente iusto.', 'Autem ducimus voluptatum facilis non a sunt inventore.', 'https://picsum.photos/id/681/800/600', '2001-12-12 19:22:41', 606, 'autem-ducimus-voluptatum-facilis-non-a-sunt-inventore'),
(616, 'Molestias perspiciatis id quia accusamus rerum voluptas. Reprehenderit id eos doloribus vero rerum. Quam est iusto facere cum maxime.', 'Dolore cum recusandae aspernatur eius.', 'https://picsum.photos/id/242/800/600', '2004-07-20 12:46:15', 606, 'dolore-cum-recusandae-aspernatur-eius'),
(617, 'Accusamus quae nihil nam. In earum eveniet quibusdam nihil nihil. Perspiciatis et aut sint asperiores.', 'Nisi quidem enim ad voluptatum.', 'https://picsum.photos/id/842/800/600', '1996-03-02 10:48:34', 606, 'nisi-quidem-enim-ad-voluptatum'),
(618, 'Eligendi eum dolor sed id consequuntur et consequatur. Dolore maiores reiciendis nihil animi nihil. Fugiat excepturi ut impedit distinctio illo tempore sunt. Dolor quibusdam earum officiis laborum autem est. Veniam repellat quo cumque voluptatem explicabo magnam ratione.', 'Aut occaecati ipsa quis.', 'https://picsum.photos/id/358/800/600', '2003-04-12 08:50:43', 606, 'aut-occaecati-ipsa-quis'),
(619, 'Voluptas consequatur quod cum quod. Alias ut et minima voluptate explicabo. Expedita soluta ratione sed.', 'Qui deserunt rerum neque suscipit natus laborum.', 'https://picsum.photos/id/490/800/600', '2013-11-29 07:15:02', 606, 'qui-deserunt-rerum-neque-suscipit-natus-laborum'),
(620, 'Impedit voluptatibus nihil repudiandae qui enim. Sed nesciunt necessitatibus non ut nemo qui ipsa. Assumenda repellendus a provident exercitationem. Numquam ipsum expedita quam et facere esse vel.', 'Ad vero nam assumenda et.', 'https://picsum.photos/id/844/800/600', '2017-07-24 13:59:56', 606, 'ad-vero-nam-assumenda-et'),
(621, 'Corporis voluptatem voluptas doloribus quae corrupti impedit. Rerum et vel sed dolor. Iusto illum porro ullam animi.', 'Quia aliquid tenetur provident inventore et.', 'https://picsum.photos/id/47/800/600', '1972-01-16 04:26:22', 606, 'quia-aliquid-tenetur-provident-inventore-et'),
(622, 'Omnis vel eum possimus. Nemo corporis repellat quia voluptatem ea vel. Tempora labore amet quis ea qui vel. Pariatur eligendi porro dicta voluptatem placeat et eos.', 'Quia molestias voluptatem doloremque ad aspernatur asperiores autem.', 'https://picsum.photos/id/820/800/600', '1990-12-21 02:33:47', 606, 'quia-molestias-voluptatem-doloremque-ad-aspernatur-asperiores-autem'),
(623, 'Eaque id neque dolorum sed minima et omnis accusamus. Et quis est doloremque. Fuga voluptatibus consectetur saepe recusandae voluptas reiciendis. Et accusantium asperiores eum. Maxime excepturi aut sint ab vitae.', 'Eos quaerat sed tempore.', 'https://picsum.photos/id/54/800/600', '2001-05-03 10:35:07', 606, 'eos-quaerat-sed-tempore'),
(624, 'Sunt voluptatem aspernatur quidem et molestias quaerat quia laboriosam. Pariatur accusamus suscipit quas reprehenderit molestiae minima sint. Deleniti est aperiam modi nam. Delectus et et aut id.', 'Itaque nihil eum nihil cupiditate non.', 'https://picsum.photos/id/773/800/600', '1976-06-23 20:43:24', 607, 'itaque-nihil-eum-nihil-cupiditate-non'),
(625, 'Distinctio qui consectetur fuga non ut molestiae. Repellendus earum iusto quis consequatur excepturi. Veritatis perferendis sunt modi qui omnis. Facere molestiae non sit iusto qui perferendis.', 'Et rem non sit voluptate.', 'https://picsum.photos/id/723/800/600', '1986-06-28 21:04:33', 607, 'et-rem-non-sit-voluptate'),
(626, 'Impedit nihil et quia sed iste tenetur molestiae. Quia quia optio voluptatem. Explicabo et quod sint. Ut ipsam culpa suscipit sit quo.', 'A nemo quidem voluptate dolor.', 'https://picsum.photos/id/152/800/600', '2008-08-20 13:27:48', 607, 'a-nemo-quidem-voluptate-dolor'),
(627, 'Consectetur est eos quos ab mollitia. Perferendis soluta voluptas ut voluptas. Et adipisci adipisci aspernatur architecto quia reprehenderit corrupti.', 'Ut iusto aliquam id et accusantium et ipsa.', 'https://picsum.photos/id/896/800/600', '1978-07-10 17:43:22', 607, 'ut-iusto-aliquam-id-et-accusantium-et-ipsa'),
(628, 'Quia a omnis culpa ut. Iusto non eum doloribus quia nihil quasi.', 'Ex eligendi ut ex voluptatem adipisci necessitatibus.', 'https://picsum.photos/id/234/800/600', '1981-04-16 07:14:57', 607, 'ex-eligendi-ut-ex-voluptatem-adipisci-necessitatibus'),
(629, 'Nihil quod labore et harum porro et dicta. Quis ipsa quas rerum. Iure tempora nobis qui sapiente quae. Quia culpa sint molestias sed omnis delectus.', 'Ex rerum est temporibus sed beatae.', 'https://picsum.photos/id/576/800/600', '1977-10-24 03:17:26', 607, 'ex-rerum-est-temporibus-sed-beatae'),
(630, 'Non est exercitationem officiis in. Tenetur asperiores molestiae accusamus enim sit dolorem officiis et. Porro ut itaque cum sint quia est. Rerum ut id fuga omnis.', 'Iste fugiat quia eos possimus eos.', 'https://picsum.photos/id/661/800/600', '1991-01-16 22:38:43', 607, 'iste-fugiat-quia-eos-possimus-eos'),
(631, 'Eveniet quisquam inventore voluptates. Rerum ipsa aut aut explicabo. Ex repudiandae fugiat aut eaque recusandae eum. Est sed rerum earum dolorem quia repudiandae aut.', 'Et saepe natus nihil veniam quibusdam voluptas voluptatem.', 'https://picsum.photos/id/993/800/600', '2020-08-15 00:26:27', 607, 'et-saepe-natus-nihil-veniam-quibusdam-voluptas-voluptatem'),
(632, 'Exercitationem expedita voluptas autem quia sint modi voluptate. Voluptate et praesentium rerum velit quae ut ut. Sed repellendus hic ducimus doloremque aut facere.', 'Et repellendus porro sed nam ea.', 'https://picsum.photos/id/1074/800/600', '2003-07-18 15:06:31', 607, 'et-repellendus-porro-sed-nam-ea'),
(633, 'Tenetur repudiandae dolor eos blanditiis assumenda aut. Sit et delectus omnis nam reprehenderit ea. Ut est aliquid nisi ea laudantium.', 'Sed nulla recusandae qui sed.', 'https://picsum.photos/id/140/800/600', '1971-04-17 04:54:42', 607, 'sed-nulla-recusandae-qui-sed'),
(634, 'Sequi ad rerum autem quisquam. Quasi incidunt molestiae ea rerum.', 'Voluptates eveniet qui tempora molestias deleniti totam.', 'https://picsum.photos/id/1060/800/600', '1983-03-07 12:05:15', 608, 'voluptates-eveniet-qui-tempora-molestias-deleniti-totam'),
(635, 'Facilis autem iste nesciunt sed velit maxime doloribus. Qui doloribus voluptatem dolorum quos autem corrupti. Qui quam iusto voluptas perspiciatis aut molestiae.', 'Sapiente sunt vel harum iusto.', 'https://picsum.photos/id/523/800/600', '2013-08-18 18:31:53', 608, 'sapiente-sunt-vel-harum-iusto'),
(636, 'Doloremque architecto sed perspiciatis quis. Ut natus animi laborum ullam quibusdam et. Temporibus deleniti ab error commodi. Illo vero incidunt voluptates et.', 'Quod labore eveniet sed corrupti.', 'https://picsum.photos/id/554/800/600', '1991-06-14 10:41:51', 608, 'quod-labore-eveniet-sed-corrupti'),
(637, 'Quia dolor eum tempore excepturi et. Illo laudantium hic aliquid sit facilis quo eveniet quae. Corporis consequatur similique maxime et et eius eius.', 'Non molestias a maiores quo id.', 'https://picsum.photos/id/687/800/600', '2001-07-20 23:59:32', 608, 'non-molestias-a-maiores-quo-id'),
(638, 'Consequuntur aut et omnis explicabo. Est est dicta dolorem corrupti illo sequi. Vel qui architecto quis error eveniet possimus.', 'Sit fuga dolores dolores vel.', 'https://picsum.photos/id/861/800/600', '1997-06-02 22:49:36', 608, 'sit-fuga-dolores-dolores-vel'),
(639, 'Expedita repellat est sunt laboriosam ut. Rem nostrum sapiente repellendus voluptatem. Expedita et voluptate assumenda est. Et molestiae laboriosam perspiciatis.', 'Sequi et quisquam autem repellat sint.', 'https://picsum.photos/id/231/800/600', '2014-04-19 00:30:01', 608, 'sequi-et-quisquam-autem-repellat-sint'),
(640, 'Quos ea facilis aliquid blanditiis temporibus ab. Molestias sit excepturi quae nihil. Quo consequatur quo optio vel. Esse porro quis ad ut blanditiis.', 'Sapiente asperiores est enim esse.', 'https://picsum.photos/id/466/800/600', '1981-05-25 07:03:14', 608, 'sapiente-asperiores-est-enim-esse'),
(641, 'Sed esse ducimus mollitia consequatur tenetur fugit dicta inventore. Dicta maxime assumenda sint minus. Cum sit ipsam dolores. Voluptatem aut tempora iure consectetur architecto aperiam doloremque.', 'Reprehenderit laborum tempora et qui.', 'https://picsum.photos/id/661/800/600', '2019-05-11 03:59:59', 608, 'reprehenderit-laborum-tempora-et-qui'),
(642, 'Velit fugiat et dolores dolor delectus pariatur non vel. Reprehenderit ipsum iusto itaque fuga voluptatem eaque sit. Quam accusantium qui repudiandae vero asperiores.', 'Est placeat qui voluptas quia.', 'https://picsum.photos/id/604/800/600', '2010-06-14 08:51:15', 608, 'est-placeat-qui-voluptas-quia'),
(643, 'Quia culpa suscipit iste aut beatae reprehenderit. Enim odio earum id. Eos voluptatibus iure assumenda qui repudiandae.', 'Eos assumenda in tempore dignissimos itaque et qui.', 'https://picsum.photos/id/896/800/600', '2019-04-07 09:38:21', 608, 'eos-assumenda-in-tempore-dignissimos-itaque-et-qui'),
(644, 'Eius cupiditate vel porro vero. Consequuntur soluta iusto ut nam necessitatibus. Voluptas voluptatem sed velit id animi iste animi.', 'Aut quod facilis hic rem vel.', 'https://picsum.photos/id/137/800/600', '2018-11-21 16:43:09', 609, 'aut-quod-facilis-hic-rem-vel'),
(645, 'Aspernatur ipsum nemo repellendus ut. Non occaecati et eaque asperiores sequi distinctio. Ex illo soluta modi.', 'Fugiat numquam consequuntur facere esse tempora provident.', 'https://picsum.photos/id/387/800/600', '1989-01-28 13:51:56', 609, 'fugiat-numquam-consequuntur-facere-esse-tempora-provident'),
(646, 'Fuga eligendi est maxime earum exercitationem in. Suscipit necessitatibus consequatur officiis explicabo et quibusdam id.', 'Accusantium neque est ut est qui adipisci illum.', 'https://picsum.photos/id/271/800/600', '2007-05-02 16:43:03', 609, 'accusantium-neque-est-ut-est-qui-adipisci-illum'),
(647, 'Voluptatem molestiae soluta eligendi eligendi vel quisquam autem. Reprehenderit similique quo non et. Iusto minus inventore ut enim eaque velit facere.', 'Voluptatem autem vel consequuntur quibusdam recusandae.', 'https://picsum.photos/id/778/800/600', '2001-11-06 19:12:21', 609, 'voluptatem-autem-vel-consequuntur-quibusdam-recusandae'),
(648, 'Molestias enim error adipisci optio quo. Quam ex exercitationem reiciendis. Voluptatum voluptas rem sunt eos cupiditate vero. Distinctio aliquam quia quia voluptatem nihil sed rerum. Qui consectetur est est provident voluptatem facilis.', 'Magnam veritatis id quia neque quo.', 'https://picsum.photos/id/87/800/600', '2016-06-25 14:40:03', 609, 'magnam-veritatis-id-quia-neque-quo'),
(649, 'Rem laudantium iste animi alias est. Commodi pariatur occaecati omnis. Id repellat atque consectetur totam.', 'Reiciendis voluptatem libero expedita natus neque deserunt accusamus.', 'https://picsum.photos/id/1084/800/600', '1970-02-02 01:54:14', 609, 'reiciendis-voluptatem-libero-expedita-natus-neque-deserunt-accusamus'),
(650, 'Consequatur est sunt inventore qui aspernatur debitis explicabo animi. Aut ratione delectus est est nam. Labore qui molestias veritatis quos.', 'Tempore maxime sint necessitatibus culpa natus.', 'https://picsum.photos/id/326/800/600', '2007-05-31 11:23:38', 609, 'tempore-maxime-sint-necessitatibus-culpa-natus'),
(651, 'Quidem pariatur enim repellat saepe nihil aut neque laborum. Assumenda iusto consequatur facere vel placeat laudantium. Culpa a cum eaque adipisci minus magni. Et animi corporis ducimus.', 'Consequatur qui doloribus voluptatibus nobis est aut amet.', 'https://picsum.photos/id/955/800/600', '2007-04-15 04:41:54', 609, 'consequatur-qui-doloribus-voluptatibus-nobis-est-aut-amet'),
(652, 'Alias provident commodi fuga quia optio eaque totam quam. Temporibus suscipit maxime omnis eos fugiat. Fugit quidem sint tempora est beatae velit aliquam. Commodi quaerat blanditiis odit placeat.', 'Ducimus eveniet molestiae aspernatur ut eius praesentium.', 'https://picsum.photos/id/1057/800/600', '2007-09-25 13:36:03', 609, 'ducimus-eveniet-molestiae-aspernatur-ut-eius-praesentium'),
(653, 'Qui dolore ea quidem libero et autem labore. Distinctio voluptas porro ut neque ipsam numquam distinctio. Nesciunt ratione consectetur qui a consectetur ipsum.', 'Reiciendis non harum omnis perspiciatis.', 'https://picsum.photos/id/1059/800/600', '2017-09-15 20:12:09', 609, 'reiciendis-non-harum-omnis-perspiciatis'),
(654, 'Quidem cupiditate aut dolores quas sed. Voluptas sint ea atque non est eum. Eum accusamus odit sequi. Doloribus sequi sit qui corporis id.', 'Ipsum et et rem et.', 'https://picsum.photos/id/861/800/600', '1990-04-23 10:02:23', 610, 'ipsum-et-et-rem-et'),
(655, 'Corporis error aliquam quasi et. Tempore suscipit enim atque non error perspiciatis quam facere. Error et porro doloribus pariatur ut repellat. Odit ad voluptatem in aut non minus qui quo.', 'Dignissimos est inventore dolores et reprehenderit et.', 'https://picsum.photos/id/939/800/600', '2013-03-30 23:25:30', 610, 'dignissimos-est-inventore-dolores-et-reprehenderit-et'),
(656, 'Earum quas in omnis delectus voluptate voluptate. Dolor inventore quae fugit officiis sapiente eaque. Asperiores dignissimos praesentium molestiae dolorem aut corporis.', 'Libero necessitatibus aut et nostrum numquam.', 'https://picsum.photos/id/250/800/600', '2006-06-13 23:21:06', 610, 'libero-necessitatibus-aut-et-nostrum-numquam'),
(657, 'Vel sint ut officia repellendus quae. Rerum qui aperiam nesciunt id sed est. Cum laudantium beatae odit deleniti facilis consequuntur. Consequuntur necessitatibus quisquam est voluptatem rerum.', 'Quos error omnis repudiandae totam quo error.', 'https://picsum.photos/id/1051/800/600', '2012-11-20 02:53:55', 610, 'quos-error-omnis-repudiandae-totam-quo-error'),
(658, 'Ut ea aut labore error nisi magnam. Hic ea veniam quo. Error id omnis quaerat amet dolorem.', 'Assumenda labore sequi sint aliquid explicabo repellat ad qui.', 'https://picsum.photos/id/873/800/600', '1984-06-06 13:47:28', 610, 'assumenda-labore-sequi-sint-aliquid-explicabo-repellat-ad-qui'),
(659, 'Quibusdam ducimus voluptatibus neque eligendi magni. Dolorem perspiciatis nesciunt quis unde. A exercitationem et est.', 'Aliquam cupiditate sit modi amet sunt natus.', 'https://picsum.photos/id/304/800/600', '1976-10-23 23:00:05', 610, 'aliquam-cupiditate-sit-modi-amet-sunt-natus'),
(660, 'Aut asperiores consequatur et rerum reprehenderit illo quo. Autem perferendis sint repellendus. Ea perspiciatis consequatur dolorem at maxime qui nam. Aut aliquam aut aut non eaque nam explicabo.', 'Illo et fugit est.', 'https://picsum.photos/id/80/800/600', '2010-07-22 15:41:03', 610, 'illo-et-fugit-est'),
(661, 'Sint perspiciatis qui facere atque. Quaerat cumque explicabo tempore accusamus aut dolorem omnis. Reprehenderit autem voluptatem quia numquam inventore. Ullam omnis aspernatur voluptatum deserunt.', 'Voluptatem sapiente minus sit sit illum et ipsum nemo.', 'https://picsum.photos/id/173/800/600', '2000-01-22 01:27:12', 610, 'voluptatem-sapiente-minus-sit-sit-illum-et-ipsum-nemo'),
(662, 'Assumenda modi voluptas laboriosam. Sunt tenetur ut harum vero. Dolorem dolor dolorem sunt vero. Ut fugiat minus quaerat.', 'Consequatur velit recusandae facere dolores minima mollitia nisi in.', 'https://picsum.photos/id/310/800/600', '2013-12-25 07:57:29', 610, 'consequatur-velit-recusandae-facere-dolores-minima-mollitia-nisi-in'),
(663, 'Architecto accusantium beatae expedita sint mollitia veritatis. Voluptas quasi sit corrupti. Perferendis dignissimos ullam voluptatibus explicabo reprehenderit. Qui quia natus doloribus ab. Inventore ea similique ullam et est velit sed voluptates.', 'Eum enim id quaerat repudiandae sunt.', 'https://picsum.photos/id/661/800/600', '2010-03-08 01:47:43', 610, 'eum-enim-id-quaerat-repudiandae-sunt');

-- --------------------------------------------------------

--
-- Structure de la table `post_category`
--

CREATE TABLE `post_category` (
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post_category`
--

INSERT INTO `post_category` (`post_id`, `category_id`) VALUES
(614, 1205),
(614, 1206),
(614, 1207),
(615, 1205),
(615, 1207),
(616, 1205),
(616, 1206),
(617, 1205),
(617, 1207),
(618, 1207),
(619, 1206),
(620, 1205),
(620, 1206),
(620, 1207),
(621, 1205),
(621, 1206),
(622, 1207),
(623, 1205),
(624, 1206),
(625, 1205),
(625, 1206),
(626, 1205),
(627, 1206),
(628, 1205),
(628, 1206),
(629, 1205),
(629, 1206),
(629, 1207),
(630, 1205),
(631, 1206),
(631, 1207),
(632, 1205),
(632, 1207),
(633, 1205),
(633, 1206),
(634, 1206),
(635, 1206),
(636, 1205),
(637, 1207),
(638, 1206),
(638, 1207),
(639, 1205),
(640, 1205),
(640, 1207),
(641, 1205),
(641, 1207),
(642, 1205),
(643, 1205),
(643, 1206),
(644, 1205),
(645, 1206),
(646, 1205),
(647, 1207),
(648, 1205),
(648, 1207),
(649, 1205),
(649, 1206),
(650, 1207),
(651, 1205),
(652, 1205),
(652, 1206),
(652, 1207),
(653, 1206),
(654, 1207),
(655, 1207),
(656, 1206),
(656, 1207),
(657, 1206),
(658, 1205),
(658, 1206),
(659, 1206),
(659, 1207),
(660, 1207),
(661, 1205),
(662, 1207),
(663, 1206),
(663, 1207);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`, `firstname`, `lastname`, `email`) VALUES
(606, 'angelo78', '[]', '$2y$13$xdZFXrC17NXkQ1aXHHJ90u88MIPJB24MG//bF2YS91wem8PU04rtW', 'Liam', 'Willms', 'moen.jany@gutmann.com'),
(607, 'kkulas', '[]', '$2y$13$ZO9WyDCxJvMwzFJcXLZyQ.gy3mrKxBLUn1l6EAcdZki9wHzBdRgB.', 'Herta', 'Lehner', 'trent37@yahoo.com'),
(608, 'streich.alejandra', '[]', '$2y$13$alD6CpX13j5vVsmKVvBfYuQyw8rndBM1OeyoKCruEFqDaUfcdu7Km', 'Destinee', 'Kessler', 'waelchi.anastasia@lockman.com'),
(609, 'kerluke.jairo', '[]', '$2y$13$h0S3tovxqchamVqlvSISC.pUrbw0ZKMopqhAeI1ftgYHZFL6yUlIe', 'Kellie', 'Donnelly', 'stanford.funk@yahoo.com'),
(610, 'scot.predovic', '[]', '$2y$13$NmK0jBkzOw65CG3wE560j.3G1s9/uQhyCICKGwiNh30knPyKbDUyG', 'Thad', 'Yundt', 'xsmith@hotmail.com'),
(611, 'Bellyne', '[\"ROLE_ADMIN\"]', '$2y$13$EWtFiN9.cHECPlXiH3WC9O1K15yFg8Mukr3jwe7bAYa4oJ/w6dDlS', 'CHARRAS', 'Marjorie', 'marjorie@3wa.io');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526C4B89032C` (`post_id`),
  ADD KEY `IDX_9474526CA76ED395` (`user_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5A8A6C8DA76ED395` (`user_id`);

--
-- Index pour la table `post_category`
--
ALTER TABLE `post_category`
  ADD PRIMARY KEY (`post_id`,`category_id`),
  ADD KEY `IDX_B9A190604B89032C` (`post_id`),
  ADD KEY `IDX_B9A1906012469DE2` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1208;

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=664;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=612;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C4B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_5A8A6C8DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `post_category`
--
ALTER TABLE `post_category`
  ADD CONSTRAINT `FK_B9A1906012469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B9A190604B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
