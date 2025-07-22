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
-- Name: contactos2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contactos2 (
    id integer DEFAULT nextval('public.contactos1_id_seq'::regclass) NOT NULL,
    nombre character varying(80),
    apellido character varying(80),
    fecha_nacimiento date,
    direccion text,
    telefono character varying(30)[],
    correo_electronico character varying(80)
);


ALTER TABLE public.contactos2 OWNER TO postgres;

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
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id integer NOT NULL,
    proveedor_id integer,
    nombre character varying(80),
    precio numeric(13,2),
    existencia integer
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productos_id_seq OWNER TO postgres;

--
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- Name: proveedores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proveedores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proveedores_id_seq OWNER TO postgres;

--
-- Name: proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedores (
    id integer DEFAULT nextval('public.proveedores_id_seq'::regclass) NOT NULL,
    nombre character varying(80),
    direccion text,
    correo_electronico character varying(80),
    telefono character varying(80),
    persona_contacto character varying(80)
);


ALTER TABLE public.proveedores OWNER TO postgres;

--
-- Name: contactos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos ALTER COLUMN id SET DEFAULT nextval('public.contactos_id_seq'::regclass);


--
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


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
-- Data for Name: contactos2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contactos2 (id, nombre, apellido, fecha_nacimiento, direccion, telefono, correo_electronico) FROM stdin;
1	ANA	VASQUEZ	1960-08-15	SANTA FE	{041287594975,042487353454}	av@gmail.com
2	PEDRO	ALMODOVAR	1950-09-01	CARICUAO	{0412346758739,04140986779,0412876947333}	pa@gmail.com
3	SARA	SUAREZ	1990-06-20	CHACAITO	{04267866559}	ss@hotmail.com
4	YOLANDA	TORTOZA	1978-10-15	CATIA LA MAR	{041454773639,041608857234}	yt@gmail.com
5	MARLENE	FERNANDES	1976-09-20	AV. LECUNA	{0212-09857583,0426-94736284}	MF@Gmai.com
6	LIBIA	COLS	1980-11-15	GUARENAS	{0414-9347424,0426-97364732}	LC@gmail.com
\.


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id, proveedor_id, nombre, precio, existencia) FROM stdin;
1	1	NEVERA	500.25	6
2	1	CONGELADOR	250.75	3
3	1	LAVADORA 10KG	300.00	8
4	1	COCINA DE GAS	120.00	10
5	2	CONGELADOR	275.00	5
6	2	HORNO ELECTRICO	450.00	3
7	2	LAVADORA 10KG	295.00	12
8	2	COCINA ELECTRICA	350.00	2
9	3	NEVERA	450.00	3
10	3	LAVADORA	380.00	6
11	3	COCINA DE GAS	230.00	12
12	3	COCINA ELECTRICA	120.00	8
13	4	NEVERA	590.75	3
14	4	CONGELADOR	249.99	6
15	4	LAVADORA 10KG	310.00	3
16	4	COCINA DE GAS	170.00	8
\.


--
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores (id, nombre, direccion, correo_electronico, telefono, persona_contacto) FROM stdin;
1	General Electric	AV. LECUNA	info@ge.com	0212-5431234	Ana Vasquez
2	Whirpool	AV. ROMULO GALLEGOS	info@whirpool.com	0212-9871234	Yolanda Tortoza
3	Electrolux	AV. DE LAS MERCEDES	info@electrolux.com	0212-2671234	Nelly Contreras
4	LG	AV. SAN MARTIN	info@gmail.com	0212-4431234	Maiba Romero
\.


--
-- Name: contactos1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contactos1_id_seq', 6, true);


--
-- Name: contactos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contactos_id_seq', 4, true);


--
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 16, true);


--
-- Name: proveedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_id_seq', 4, true);


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
-- Name: contactos2 contactos2_correo_electronico_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos2
    ADD CONSTRAINT contactos2_correo_electronico_key UNIQUE (correo_electronico);


--
-- Name: contactos2 contactos2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos2
    ADD CONSTRAINT contactos2_pkey PRIMARY KEY (id);


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
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- Name: proveedores proveedores_correo_electronico_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_correo_electronico_key UNIQUE (correo_electronico);


--
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- Name: productos productos_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id);


--
-- PostgreSQL database dump complete
--

