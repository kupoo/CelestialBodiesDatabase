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
    name character varying(30),
    size_in_light_years integer NOT NULL,
    constellation text,
    distance_from_milkyway_mly numeric
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
    name character varying(30),
    designation character varying(30) NOT NULL,
    gravity numeric,
    planet_id integer
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
    name character varying(30),
    gravity_ms_squared numeric,
    has_life boolean NOT NULL,
    planet_type_id integer,
    radius_miles numeric,
    distance_from_earth numeric,
    distance_unit_of_measurement character varying(50),
    is_exoplanet boolean,
    star_id integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30),
    description text,
    is_true_planet boolean NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer,
    constellation text NOT NULL,
    temperature_in_kelvins integer
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 61120, 'Triangulum', 3);
INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 152000, 'Andromeda', 2.5);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 60000, 'Centaurus', 13);
INSERT INTO public.galaxy VALUES (5, 'Sculptor Galaxy', 120500, 'Sculptor', 12.7);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 88000, 'Sagittarius', 0);
INSERT INTO public.galaxy VALUES (2, 'Comet Galaxy', 600000, 'Sculptor', 3200);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (7, 'Hyperion', 'Saturn VII', 0.019, 6);
INSERT INTO public.moon VALUES (8, 'Rhea', 'Saturn V', -0.26, 6);
INSERT INTO public.moon VALUES (9, 'Titan', 'Saturn VI', 1.352, 6);
INSERT INTO public.moon VALUES (10, 'Dione', 'Saturn IV', 0.232, 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', 'Saturn II', 0.113, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 'Saturn VIII', 0.223, 6);
INSERT INTO public.moon VALUES (13, 'Mimas', 'Saturn I', 0.064, 6);
INSERT INTO public.moon VALUES (4, 'Callisto', 'Jupiter IV', 1.235, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Jupiter II', 1.314, 5);
INSERT INTO public.moon VALUES (6, 'Io', 'Jupiter I', 1.796, 5);
INSERT INTO public.moon VALUES (2, 'Demios', 'Mars II', 0.003, 4);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Mars I', 0.0057, 4);
INSERT INTO public.moon VALUES (1, 'Luna', 'Earth I', 1.622, 3);
INSERT INTO public.moon VALUES (14, 'Ariel', 'Uranus I', 0.246, 7);
INSERT INTO public.moon VALUES (15, 'Oberon', 'Uranus IV', 0.358, 7);
INSERT INTO public.moon VALUES (16, 'Titania', 'Uranus III', 0.371, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Uranus  II', 0.252, 7);
INSERT INTO public.moon VALUES (18, 'Nereid', 'Neptune II', 0.075, 8);
INSERT INTO public.moon VALUES (19, 'Triton', 'Neptune I', 0.779, 8);
INSERT INTO public.moon VALUES (20, 'Charon', 'Pluto I', 0.288, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 3.7, false, 2, 1516, 48, 'million miles', false, 4);
INSERT INTO public.planet VALUES (2, 'Venus', 8.87, false, 2, 3760.4, 24, 'million miles', false, 4);
INSERT INTO public.planet VALUES (4, 'Mars', 3.71, false, 2, 2106.1, 140, 'million miles', false, 4);
INSERT INTO public.planet VALUES (3, 'Earth', 9.807, true, 2, 3958.8, 0, 'million miles', false, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 24.79, false, 1, 43441, 551.57, 'million miles', false, 4);
INSERT INTO public.planet VALUES (6, 'Saturn', 10.44, false, 1, 36184, 887.92, 'million miles', false, 4);
INSERT INTO public.planet VALUES (7, 'Uranus', 8.87, false, 1, 15759, 1.8968, 'billion miles', false, 4);
INSERT INTO public.planet VALUES (8, 'Neptune', 11.15, false, 1, 15299, 2.7771, 'billion miles', false, 4);
INSERT INTO public.planet VALUES (9, 'Pluto', 0.62, false, 3, 738.38, 3.1765, 'billion miles', false, 4);
INSERT INTO public.planet VALUES (10, '51 Pegasi b', NULL, false, 1, NULL, 51, 'light years', true, 4);
INSERT INTO public.planet VALUES (11, '47 Ursae Majoris b', NULL, false, 1, NULL, 46, 'light years', true, 4);
INSERT INTO public.planet VALUES (12, 'COROT-7b', NULL, false, 2, NULL, 490, 'light years', true, 4);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Gas Giant', 'A massive planet composed primarily of hydrogen and helium.', true);
INSERT INTO public.planet_type VALUES (2, 'Terrestrial Planet', 'Also known as a telluric planet or rocky planet. A planet that is composed primarily of carbonaceous or silicate rocks or metals. ', true);
INSERT INTO public.planet_type VALUES (3, 'Dwarf Planet', 'A small planetary-mass object that is in direct orbit around the Sun, massive enough to be gravitationally rounded, but insufficient to achieve orbital dominance.', false);
INSERT INTO public.planet_type VALUES (4, 'Exoplanet', 'A planet that is outside of our solar system.', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 1, 'Andromeda', 19885);
INSERT INTO public.star VALUES (2, 'Uúba', 5, 'Sculptor', 5443);
INSERT INTO public.star VALUES (3, 'Cocibolca', 5, 'Sculptor', 5717);
INSERT INTO public.star VALUES (4, 'The Sun', 3, 'Taurus', 15700000);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 4, 'Centaurus', 11042);
INSERT INTO public.star VALUES (6, 'Arcturus', 3, 'Boötes', 4286);
INSERT INTO public.star VALUES (7, 'Beta Trianguli', 6, 'Triangulum', 8186);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_type_id);


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
-- Name: planet planet_closest_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_closest_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

