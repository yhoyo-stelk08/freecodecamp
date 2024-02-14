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
-- Name: creatures; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.creatures (
    creature_id integer NOT NULL,
    name character varying(30) NOT NULL,
    descriptions text,
    planet_id integer NOT NULL,
    is_hostile boolean DEFAULT false
);


ALTER TABLE public.creatures OWNER TO freecodecamp;

--
-- Name: creatures_creature_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.creatures_creature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creatures_creature_id_seq OWNER TO freecodecamp;

--
-- Name: creatures_creature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.creatures_creature_id_seq OWNED BY public.creatures.creature_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_types integer,
    distances_from_earth integer,
    age_in_millions_of_years numeric(4,2),
    description text,
    has_life boolean DEFAULT false,
    is_spherical boolean DEFAULT true
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
    moon_types integer,
    distances_from_earth integer,
    age_in_millions_of_years numeric(4,2),
    description text,
    has_life boolean DEFAULT false,
    is_spherical boolean DEFAULT true,
    planet_id integer NOT NULL
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_types integer,
    distances_from_earth integer,
    age_in_millions_of_years numeric(4,2),
    description text,
    has_life boolean DEFAULT false,
    is_spherical boolean DEFAULT true,
    star_id integer NOT NULL
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
    star_types integer,
    distances_from_earth integer,
    age_in_millions_of_years numeric(4,2),
    description text,
    has_life boolean DEFAULT false,
    is_spherical boolean DEFAULT true,
    galaxy_id integer NOT NULL
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
-- Name: creatures creature_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creatures ALTER COLUMN creature_id SET DEFAULT nextval('public.creatures_creature_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: creatures; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 1, 23, 12.12, 'Andromeda, which is shortened from "Andromeda Galaxy", gets its name from the area of the sky in which it appears, the constellation of Andromeda.', false, true);
INSERT INTO public.galaxy VALUES (2, 'Antennae', 1, 23, 12.12, 'Appearance is similar to an insects antennae', false, true);
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', 1, 23, 12.12, 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation', false, true);
INSERT INTO public.galaxy VALUES (4, 'Bear Paw Galaxy', 1, 23, 12.12, 'It resembles the appearance of a bears claw', false, true);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 1, 23, 12.12, 'It has a spectacular dark band of absorbing dust in front of the galaxys bright nucleus, giving rise to its nicknames of the "Black Eye" or "Evil Eye" galaxy.', false, true);
INSERT INTO public.galaxy VALUES (6, 'Bode Galaxy', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (9, 'Moon', 2, 23, 12.12, 'It resembles the appearance of a bears claw', false, true, 9);
INSERT INTO public.moon VALUES (10, 'Enceladus', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 9);
INSERT INTO public.moon VALUES (11, 'Ganymede', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 11);
INSERT INTO public.moon VALUES (12, 'Hyperion', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 12);
INSERT INTO public.moon VALUES (13, 'Mimas', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 13);
INSERT INTO public.moon VALUES (14, 'Nereid', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 20);
INSERT INTO public.moon VALUES (15, 'Himalia', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 10);
INSERT INTO public.moon VALUES (16, 'Europa', 2, 23, 12.12, 'It has a spectacular dark band of absorbing dust in front of the galaxys bright nucleus, giving rise to its nicknames of the "Black Eye" or "Evil Eye" galaxy.', false, true, 12);
INSERT INTO public.moon VALUES (27, 'Lapetus', 2, 23, 12.12, 'It resembles the appearance of a bears claw', false, true, 9);
INSERT INTO public.moon VALUES (28, 'Deimos', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 9);
INSERT INTO public.moon VALUES (29, 'Anthe', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 11);
INSERT INTO public.moon VALUES (30, 'Hippocamp', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 12);
INSERT INTO public.moon VALUES (31, 'Pasiphae', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 13);
INSERT INTO public.moon VALUES (32, 'Sinope', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 20);
INSERT INTO public.moon VALUES (33, 'Dione', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 10);
INSERT INTO public.moon VALUES (34, 'Sycorax', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 10);
INSERT INTO public.moon VALUES (35, 'Thalassa', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 10);
INSERT INTO public.moon VALUES (36, 'Titania', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 8);
INSERT INTO public.moon VALUES (37, 'Carme', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 8);
INSERT INTO public.moon VALUES (38, 'Ariel', 2, 23, 12.12, 'It has a spectacular dark band of absorbing dust in front of the galaxys bright nucleus, giving rise to its nicknames of the "Black Eye" or "Evil Eye" galaxy.', false, true, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (8, 'Mars', 1, 23, 12.12, 'It resembles the appearance of a bears claw', false, true, 1);
INSERT INTO public.planet VALUES (9, 'Jupiter', 2, 23, 12.12, 'It resembles the appearance of a bears claw', false, true, 2);
INSERT INTO public.planet VALUES (10, 'Venus', 3, 23, 12.12, 'It resembles the appearance of a bears claw', false, true, 4);
INSERT INTO public.planet VALUES (11, 'Earth', 3, 23, 12.12, 'It resembles the appearance of a bears claw', true, true, 4);
INSERT INTO public.planet VALUES (12, 'Mercurius', 2, 23, 12.12, 'It resembles the appearance of a bears claw', false, true, 6);
INSERT INTO public.planet VALUES (13, 'Pluto', 2, 23, 12.12, 'It resembles the appearance of a bears claw', false, true, 3);
INSERT INTO public.planet VALUES (14, '11 Com B', 2, 23, 12.12, 'It resembles the appearance of a bears claw', false, true, 2);
INSERT INTO public.planet VALUES (15, 'Saturnus', 2, 23, 12.12, 'It has a spectacular dark band of absorbing dust in front of the galaxys bright nucleus, giving rise to its nicknames of the "Black Eye" or "Evil Eye" galaxy.', false, true, 2);
INSERT INTO public.planet VALUES (16, 'Neptunus', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 1);
INSERT INTO public.planet VALUES (18, '11 Com F', 2, 23, 12.12, 'It resembles the appearance of a bears claw', false, true, 2);
INSERT INTO public.planet VALUES (19, '12 Com A', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 1);
INSERT INTO public.planet VALUES (20, '11 Cyg A', 2, 23, 12.12, 'It has a spectacular dark band of absorbing dust in front of the galaxys bright nucleus, giving rise to its nicknames of the "Black Eye" or "Evil Eye" galaxy.', false, true, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, 23, 12.12, 'It resembles the appearance of a bears claw', false, true, 1);
INSERT INTO public.star VALUES (2, 'Capella', 2, 23, 12.12, 'It resembles the appearance of a bears claw', false, true, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 3, 23, 12.12, 'It resembles the appearance of a bears claw', false, true, 4);
INSERT INTO public.star VALUES (4, 'Achernar', 2, 23, 12.12, 'It resembles the appearance of a bears claw', false, true, 6);
INSERT INTO public.star VALUES (5, 'Arcturus', 2, 23, 12.12, 'It has a spectacular dark band of absorbing dust in front of the galaxys bright nucleus, giving rise to its nicknames of the "Black Eye" or "Evil Eye" galaxy.', false, true, 2);
INSERT INTO public.star VALUES (6, 'Vega', 1, 23, 12.12, 'Named for Johann Elert Bode who discovered this galaxy in 1774', false, true, 1);


--
-- Name: creatures_creature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.creatures_creature_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 38, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: creatures creatures_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creatures
    ADD CONSTRAINT creatures_name_key UNIQUE (name);


--
-- Name: creatures creatures_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creatures
    ADD CONSTRAINT creatures_pkey PRIMARY KEY (creature_id);


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
-- Name: creatures fk_creatures_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creatures
    ADD CONSTRAINT fk_creatures_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

