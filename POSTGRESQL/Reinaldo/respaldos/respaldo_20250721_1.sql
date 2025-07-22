--
-- PostgreSQL database dump
--

-- Dumped from database version 17rc1
-- Dumped by pg_dump version 17rc1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: contactos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contactos (
    id integer NOT NULL,
    nombre character varying(80),
    apellido character varying(80),
    fecha_nacimiento date,
    direccion text,
    telefono character varying(80),
    correo_electronico character varying(80)
);


ALTER TABLE public.contactos OWNER TO postgres;

--
-- Name: contactos1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contactos1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contactos1_id_seq OWNER TO postgres;

--
-- Name: contactos1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contactos1 (
    id integer DEFAULT nextval('public.contactos1_id_seq'::regclass) NOT NULL,
    nombre character varying(80),
    apellido character varying(80),
    fecha_nacimiento date,
    direccion text,
    telefono character varying(80),
    correo_electronico character varying(80)
);


ALTER TABLE public.contactos1 OWNER TO postgres;

--
-- Name: contactos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contactos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contactos_id_seq OWNER TO postgres;

--
-- Name: contactos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contactos_id_seq OWNED BY public.contactos.id;


--
-- Name: contactos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos ALTER COLUMN id SET DEFAULT nextval('public.contactos_id_seq'::regclass);


--
-- Data for Name: contactos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contactos (id, nombre, apellido, fecha_nacimiento, direccion, telefono, correo_electronico) FROM stdin;
1	ANA	VASQUEZ	1960-08-15	SANTA FE	04123465134	av@gmail.com
2	PEDRO	ALMODOVAR	1950-09-01	CARICUAO	0412346758739	pa@gmail.com
3	SARA	SUAREZ	1990-06-20	CHACAITO	04267866559	ss@hotmail.com
4	YOLANDA	TORTOZA	1978-10-15	CATIA LA MAR	041454773639	yt@gmail.com
\.


--
-- Data for Name: contactos1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contactos1 (id, nombre, apellido, fecha_nacimiento, direccion, telefono, correo_electronico) FROM stdin;
\.


--
-- Name: contactos1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contactos1_id_seq', 1, false);


--
-- Name: contactos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contactos_id_seq', 4, true);


--
-- Name: contactos1 contactos1_correo_electronico_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos1
    ADD CONSTRAINT contactos1_correo_electronico_key UNIQUE (correo_electronico);


--
-- Name: contactos1 contactos1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos1
    ADD CONSTRAINT contactos1_pkey PRIMARY KEY (id);


--
-- Name: contactos contactos_correo_electronico_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos
    ADD CONSTRAINT contactos_correo_electronico_key UNIQUE (correo_electronico);


--
-- Name: contactos contactos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos
    ADD CONSTRAINT contactos_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

