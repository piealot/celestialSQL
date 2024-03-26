--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    notes text,
    constellation character varying(50),
    origin_of_name text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    radius integer,
    density numeric(4,3)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    name character varying(30) NOT NULL,
    info text
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    radius_in_km integer,
    life boolean,
    description text,
    age integer,
    has_water boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    density numeric(4,3),
    age bigint
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing the Sun and its Solar System, and therefore Earth.', 'Sagittarius', 'The appearance from Earth of the galaxy—a band of light');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. ', 'Andromeda', 'Andromeda, which is shortened from Andromeda Galaxy, gets its name from the area of the sky in which it appears, the constellation of Andromeda.');
INSERT INTO public.galaxy VALUES (3, 'Black Eye Galaxy', 'Sleeping Beauty Galaxy', 'Coma Berenices', 'It has a spectacular dark band of absorbing dust in front of the galaxys bright nucleus');
INSERT INTO public.galaxy VALUES (4, 'Butterfly Galaxies', '', 'Virgo', 'Looks are similar to a butterfly.');
INSERT INTO public.galaxy VALUES (5, 'Cigar Galaxy', 'Also known as Messier 82 or M82', 'Ursa Major', 'Appears similar in shape to a cigar.');
INSERT INTO public.galaxy VALUES (6, 'Eye of God', 'A prototype for multi-arm spiral galaxies', 'Eridanus', 'Name after its structural appearance');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon (Luna)', 3, 1737, 3.340);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, 1.876);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, 1.471);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1822, 3.527);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1561, 3.013);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, 1.936);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, 1.834);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2575, 1.880);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 764, 1.233);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 736, 1.088);
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 198, 1.147);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 561, 1.478);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 531, 0.973);
INSERT INTO public.moon VALUES (14, 'Enceladus', 6, 252, 1.608);
INSERT INTO public.moon VALUES (15, 'Hyperion', 6, 133, 0.550);
INSERT INTO public.moon VALUES (16, 'Miranda', 7, 236, 1.210);
INSERT INTO public.moon VALUES (17, 'Ariel', 7, 579, 1.592);
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, 585, 1.390);
INSERT INTO public.moon VALUES (19, 'Titania', 7, 789, 1.710);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 1353, 2.061);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 'Neutron Stars', 'Neutron stars are incredibly dense objects formed from the remnants of massive stars after a supernova explosion. Despite being only about 20 kilometers (12 miles) in diameter, neutron stars can have masses greater than that of the Sun. Neutron stars have extremely strong magnetic fields and rotate rapidly, emitting beams of radiation that can be observed as pulsating signals, leading to their classification as pulsars.');
INSERT INTO public.more_info VALUES (2, 'Galaxies', 'Galaxies are vast collections of stars, gas, dust, and dark matter bound together by gravity. The Milky Way, our home galaxy, is estimated to contain around 100 to 400 billion stars and is just one of billions of galaxies in the observable universe. Galaxies come in various shapes and sizes, including spiral, elliptical, and irregular, with each type offering unique insights into the universe''s evolution.');
INSERT INTO public.more_info VALUES (3, 'Black Holes', 'Black holes are regions of spacetime where gravity is so strong that nothing, not even light, can escape from them. Black holes can form from the collapse of massive stars or the merging of compact objects, such as neutron stars. Despite their name, black holes are not entirely "black" and can emit radiation through processes like Hawking radiation, which causes them to slowly lose mass over time.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 2440, false, 'Mercury is the closest planet to the Sun and the smallest planet in the Solar System.', 5, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 6052, false, 'Venus is the second planet from the Sun and often called Earth''s "sister planet."', 5, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 6371, true, 'Earth is the third planet from the Sun and the only known planet to support life.', 5, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 3390, false, 'Mars is the fourth planet from the Sun and often called the "Red Planet."', 5, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 69911, false, 'Jupiter is the largest planet in the Solar System and a gas giant composed mostly of hydrogen and helium.', 5, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 58232, false, 'Saturn is the sixth planet from the Sun and known for its extensive ring system.', 5, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 25362, false, 'Uranus is the seventh planet from the Sun and known for its extreme seasonal variations.', 5, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 24622, false, 'Neptune is the eighth and farthest planet from the Sun, known for its vivid blue color.', 5, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 1186, false, 'Pluto is a dwarf planet located in the Kuiper Belt beyond Neptune''s orbit.', 5, false);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 2, 8700, false, 'Kepler-186f is an exoplanet orbiting the star Kepler-186 in the constellation Cygnus.', 4, false);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 2, 8900, false, 'Proxima Centauri b is an exoplanet orbiting in the habitable zone of Proxima Centauri.', 5, false);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 3, 9200, false, 'TRAPPIST-1e is part of the TRAPPIST-1 system, about 39 light-years from Earth.', 5, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.408, 4600000000);
INSERT INTO public.star VALUES (2, 'Alpheratz', 2, 2.000, 60000000);
INSERT INTO public.star VALUES (3, 'Canis Majoris', 1, 2.000, 8200000);
INSERT INTO public.star VALUES (4, 'AH Scorpii', 1, 2.000, 90000000);
INSERT INTO public.star VALUES (5, 'Mirach', 2, 1.500, 12000000);
INSERT INTO public.star VALUES (6, 'UY Scuti', 1, 0.070, 8000000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

