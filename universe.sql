--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(40),
    n_stars integer,
    color text NOT NULL,
    size numeric(4,1) NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: galaxy_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_planet (
    galaxy_planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    reaction text
);


ALTER TABLE public.galaxy_planet OWNER TO freecodecamp;

--
-- Name: galaxy_planet_galaxy_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_planet_galaxy_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_planet_galaxy_planet_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_planet_galaxy_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_planet_galaxy_planet_id_seq OWNED BY public.galaxy_planet.galaxy_planet_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(40),
    moon_id integer NOT NULL,
    loveit boolean,
    size_kparsec numeric(3,0) NOT NULL,
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
    name character varying(40),
    solidarity boolean NOT NULL,
    size numeric(4,1) NOT NULL,
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(40),
    n_planets integer,
    color character varying(30),
    size_kparsec numeric(4,1) NOT NULL,
    star_id integer NOT NULL,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_planet galaxy_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet ALTER COLUMN galaxy_planet_id SET DEFAULT nextval('public.galaxy_planet_galaxy_planet_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda', 1, 'Red', 394.5, 1);
INSERT INTO public.galaxy VALUES ('Canis Major', 1, 'Orange', 456.8, 2);
INSERT INTO public.galaxy VALUES ('Cygnus A', 1, 'Yellow', 33.7, 3);
INSERT INTO public.galaxy VALUES ('Magellnaic', 1, 'Green', 244.9, 4);
INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'Blue', 40.0, 5);
INSERT INTO public.galaxy VALUES ('Virgo A', 1, 'Indigo', 433.8, 6);


--
-- Data for Name: galaxy_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_planet VALUES (1, 'galaxy', 'it was good');
INSERT INTO public.galaxy_planet VALUES (2, 'planet', 'fantastic');
INSERT INTO public.galaxy_planet VALUES (3, 'star', 'phenomenon');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Europa', 1, true, 33, 1);
INSERT INTO public.moon VALUES ('Enceladus', 2, true, 33, 2);
INSERT INTO public.moon VALUES ('Triton', 3, true, 83, 3);
INSERT INTO public.moon VALUES ('lapetus', 4, false, 54, 6);
INSERT INTO public.moon VALUES ('Hirwa', 5, true, 83, 4);
INSERT INTO public.moon VALUES ('Blue', 6, false, 54, 5);
INSERT INTO public.moon VALUES ('Arnold', 7, true, 43, 7);
INSERT INTO public.moon VALUES ('Hateg', 8, false, 43, 8);
INSERT INTO public.moon VALUES ('Damn', 9, false, 43, 9);
INSERT INTO public.moon VALUES ('Mater', 10, true, 43, 10);
INSERT INTO public.moon VALUES ('Pater', 11, true, 43, 11);
INSERT INTO public.moon VALUES ('bruh', 12, true, 43, 12);
INSERT INTO public.moon VALUES ('What', 15, true, 23, 1);
INSERT INTO public.moon VALUES ('story', 16, true, 23, 2);
INSERT INTO public.moon VALUES ('Sis', 13, true, 23, 3);
INSERT INTO public.moon VALUES ('Aunt', 14, true, 23, 4);
INSERT INTO public.moon VALUES ('Hey', 17, false, 33, 5);
INSERT INTO public.moon VALUES ('It', 18, false, 33, 6);
INSERT INTO public.moon VALUES ('About', 19, false, 33, 7);
INSERT INTO public.moon VALUES ('Down', 20, false, 33, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('PA-99-N2', true, 432.3, 1, 1);
INSERT INTO public.planet VALUES ('HR-2447', false, 43.2, 2, 2);
INSERT INTO public.planet VALUES ('Deneb', true, 43.2, 3, 3);
INSERT INTO public.planet VALUES ('Sadr', false, 498.2, 3, 4);
INSERT INTO public.planet VALUES ('Fawaris', true, 754.2, 3, 5);
INSERT INTO public.planet VALUES ('Dwarf_1', false, 83.2, 4, 6);
INSERT INTO public.planet VALUES ('Dwarf_2', true, 432.2, 4, 7);
INSERT INTO public.planet VALUES ('Jupeter', false, 23.3, 5, 8);
INSERT INTO public.planet VALUES ('Venus', true, 232.2, 5, 9);
INSERT INTO public.planet VALUES ('Earth', false, 533.2, 5, 10);
INSERT INTO public.planet VALUES ('Pluto', true, 23.3, 5, 11);
INSERT INTO public.planet VALUES ('Mercury', true, 232.7, 6, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Alpheratz', 1, 'Violet', 43.3, 1, 1);
INSERT INTO public.star VALUES ('sirius', 1, 'Violet', 432.6, 2, 2);
INSERT INTO public.star VALUES ('Vega', 3, 'Yellow', 343.3, 3, 3);
INSERT INTO public.star VALUES ('Dorado', 2, 'blue', 832.6, 4, 4);
INSERT INTO public.star VALUES ('Sun', 4, 'Yellow', 983.2, 5, 5);
INSERT INTO public.star VALUES ('Heze', 1, 'Brown', 432.3, 6, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_planet_galaxy_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_planet_galaxy_planet_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_planet galaxy_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
    ADD CONSTRAINT galaxy_planet_name_key UNIQUE (name);


--
-- Name: galaxy_planet galaxy_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
    ADD CONSTRAINT galaxy_planet_pkey PRIMARY KEY (galaxy_planet_id);


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
-- Name: galaxy unique_size; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_size UNIQUE (size);


--
-- Name: moon moon_moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_plan_gal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_plan_gal_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

