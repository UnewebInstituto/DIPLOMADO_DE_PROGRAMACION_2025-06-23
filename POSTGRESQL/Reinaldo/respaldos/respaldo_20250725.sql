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

--
-- Name: profesion; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.profesion AS ENUM (
    'salud',
    'educacion',
    'ingenieria',
    'economia',
    'seguridad',
    'recreacion',
    'deporte',
    'otra'
);


ALTER TYPE public.profesion OWNER TO postgres;

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
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personas (
    doc character(1),
    cedula integer,
    nombre character varying(80),
    apellido character varying(80),
    direccion text,
    actividad public.profesion DEFAULT 'otra'::public.profesion,
    correo_electronico character varying(80),
    fecha_nacimiento date
);


ALTER TABLE public.personas OWNER TO postgres;

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
-- Name: productos1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos1 (
    id integer NOT NULL,
    proveedor_id integer,
    nombre character varying(80),
    precio numeric(13,2),
    existencia integer
);


ALTER TABLE public.productos1 OWNER TO postgres;

--
-- Name: productos1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productos1_id_seq OWNER TO postgres;

--
-- Name: productos1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos1_id_seq OWNED BY public.productos1.id;


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
-- Name: productos_sin_fk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos_sin_fk (
    id integer NOT NULL,
    proveedor_id integer,
    nombre character varying(80),
    precio numeric(13,2),
    existencia integer
);


ALTER TABLE public.productos_sin_fk OWNER TO postgres;

--
-- Name: productos_sin_fk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_sin_fk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productos_sin_fk_id_seq OWNER TO postgres;

--
-- Name: productos_sin_fk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_sin_fk_id_seq OWNED BY public.productos_sin_fk.id;


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
-- Name: proveedores1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedores1 (
    id integer NOT NULL,
    nombre character varying(40),
    direccion text,
    telefono character varying(20),
    correo character varying(80)
);


ALTER TABLE public.proveedores1 OWNER TO postgres;

--
-- Name: proveedores1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proveedores1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proveedores1_id_seq OWNER TO postgres;

--
-- Name: proveedores1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores1_id_seq OWNED BY public.proveedores1.id;


--
-- Name: vista_prov_pro_01; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_prov_pro_01 AS
 SELECT a.nombre AS proveedor,
    a.persona_contacto AS contacto,
    a.telefono,
    b.nombre AS producto,
    b.precio
   FROM public.proveedores a,
    public.productos b
  WHERE (b.proveedor_id = a.id);


ALTER VIEW public.vista_prov_pro_01 OWNER TO postgres;

--
-- Name: vista_prov_prod_full_join; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_prov_prod_full_join AS
 SELECT a.nombre AS proveedor,
    a.persona_contacto AS contacto,
    a.telefono,
    b.nombre AS producto,
    b.precio
   FROM (public.proveedores a
     LEFT JOIN public.productos_sin_fk b ON ((b.proveedor_id = a.id)))
UNION
 SELECT a.nombre AS proveedor,
    a.persona_contacto AS contacto,
    a.telefono,
    b.nombre AS producto,
    b.precio
   FROM (public.proveedores a
     RIGHT JOIN public.productos_sin_fk b ON ((b.proveedor_id = a.id)));


ALTER VIEW public.vista_prov_prod_full_join OWNER TO postgres;

--
-- Name: vista_prov_prod_inner_join; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_prov_prod_inner_join AS
 SELECT a.nombre AS proveedor,
    a.persona_contacto AS contacto,
    a.telefono,
    b.nombre AS producto,
    b.precio
   FROM (public.proveedores a
     JOIN public.productos_sin_fk b ON ((b.proveedor_id = a.id)));


ALTER VIEW public.vista_prov_prod_inner_join OWNER TO postgres;

--
-- Name: vista_prov_prod_left_join; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_prov_prod_left_join AS
 SELECT a.nombre AS proveedor,
    a.persona_contacto AS contacto,
    a.telefono,
    b.nombre AS producto,
    b.precio
   FROM (public.proveedores a
     LEFT JOIN public.productos_sin_fk b ON ((b.proveedor_id = a.id)));


ALTER VIEW public.vista_prov_prod_left_join OWNER TO postgres;

--
-- Name: vista_prov_prod_right_join; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_prov_prod_right_join AS
 SELECT a.nombre AS proveedor,
    a.persona_contacto AS contacto,
    a.telefono,
    b.nombre AS producto,
    b.precio
   FROM (public.proveedores a
     RIGHT JOIN public.productos_sin_fk b ON ((b.proveedor_id = a.id)));


ALTER VIEW public.vista_prov_prod_right_join OWNER TO postgres;

--
-- Name: contactos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos ALTER COLUMN id SET DEFAULT nextval('public.contactos_id_seq'::regclass);


--
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- Name: productos1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos1 ALTER COLUMN id SET DEFAULT nextval('public.productos1_id_seq'::regclass);


--
-- Name: productos_sin_fk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_sin_fk ALTER COLUMN id SET DEFAULT nextval('public.productos_sin_fk_id_seq'::regclass);


--
-- Name: proveedores1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores1 ALTER COLUMN id SET DEFAULT nextval('public.proveedores1_id_seq'::regclass);


--
-- Data for Name: contactos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contactos (id, nombre, apellido, fecha_nacimiento, direccion, telefono, correo_electronico) FROM stdin;
1	ANA	VASQUEZ	1960-08-15	SANTA FE	04123465134	av@gmail.com
3	SARA	SUAREZ	1990-06-20	CHACAITO	04267866559	ss@hotmail.com
4	YOLANDA	TORTOZA	1978-10-15	CATIA LA MAR	041454773639	yt@gmail.com
5	VIVIANA	RAMIREZ	2000-12-15	TERRAZAS DEL AVILA	0412-64234334	vr@gmail.com
6	Livia	Cols	1980-01-22	GUARENAS	0414-233245687	lv@gmail.com
2	PEDRO	ALMODOVAR	1950-09-01	CHARALLAVE	0412346758739	pa@gmail.com
\.


--
-- Data for Name: contactos1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contactos1 (id, nombre, apellido, fecha_nacimiento, direccion, telefono, correo_electronico) FROM stdin;
1	ANA	VASQUEZ	1960-08-15	SANTA FE	04123465134	av@gmail.com
3	SARA	SUAREZ	1990-06-20	CHACAITO	04267866559	ss@hotmail.com
4	YOLANDA	TORTOZA	1978-10-15	CATIA LA MAR	041454773639	yt@gmail.com
5	VIVIANA	RAMIREZ	2000-12-15	TERRAZAS DEL AVILA	0412-64234334	vr@gmail.com
6	Livia	Cols	1980-01-22	GUARENAS	0414-233245687	lv@gmail.com
2	PEDRO	ALMODOVAR	1950-09-01	CHARALLAVE	0412346758739	pa@gmail.com
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
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personas (doc, cedula, nombre, apellido, direccion, actividad, correo_electronico, fecha_nacimiento) FROM stdin;
V	1234	Ana	Vasquez	Santa Fe	economia	av@gmail.com	1960-08-01
E	8100	Pedro	Almodovar	Caricuao	deporte	pa@gmail.com	1950-09-15
P	9100	Sara	Suarez	Chacaito	educacion	ss@hotmail.com	1990-06-20
V	5678	Yolanda	Tortoza	catia la mar	salud	yt@hotmail.com	1978-10-15
V	9797	linda	evan	la castellana	otra	lv@ghotmail.com	1975-10-20
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
-- Data for Name: productos1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos1 (id, proveedor_id, nombre, precio, existencia) FROM stdin;
\.


--
-- Data for Name: productos_sin_fk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos_sin_fk (id, proveedor_id, nombre, precio, existencia) FROM stdin;
1	1	NEVERA	500.25	6
2	1	CONGELADOR	250.75	3
3	1	LAVADORA 10KG	300.00	8
4	5	COCINA DE GAS	120.00	10
5	2	CONGELADOR	275.00	5
6	2	HORNO ELECTRICO	450.00	3
7	2	LAVADORA 10KG	295.00	12
8	6	COCINA ELECTRICA	350.00	2
9	3	NEVERA	450.00	3
10	3	LAVADORA	380.00	6
11	3	COCINA DE GAS	230.00	12
12	7	COCINA ELECTRICA	120.00	8
13	4	NEVERA	590.75	3
14	4	CONGELADOR	249.99	6
15	4	LAVADORA 10KG	310.00	3
16	8	COCINA DE GAS	170.00	8
\.


--
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores (id, nombre, direccion, correo_electronico, telefono, persona_contacto) FROM stdin;
1	General Electric	AV. LECUNA	info@ge.com	0212-5431234	Ana Vasquez
2	Whirpool	AV. ROMULO GALLEGOS	info@whirpool.com	0212-9871234	Yolanda Tortoza
3	Electrolux	AV. DE LAS MERCEDES	info@electrolux.com	0212-2671234	Nelly Contreras
4	LG	AV. SAN MARTIN	info@gmail.com	0212-4431234	Maiba Romero
9	HAIR	AV. DEL VALLE	info@hair.com	0212-645123	Rosa Gonzales
10	DAMASCO	AV. FCO. DE MIRANDA	info@damasco.com	0212-2431234	Roraima Rojas
\.


--
-- Data for Name: proveedores1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores1 (id, nombre, direccion, telefono, correo) FROM stdin;
\.


--
-- Name: contactos1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contactos1_id_seq', 6, true);


--
-- Name: contactos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contactos_id_seq', 1, false);


--
-- Name: productos1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos1_id_seq', 1, false);


--
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 16, true);


--
-- Name: productos_sin_fk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_sin_fk_id_seq', 16, true);


--
-- Name: proveedores1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores1_id_seq', 1, false);


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
-- Name: productos1 productos1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos1
    ADD CONSTRAINT productos1_pkey PRIMARY KEY (id);


--
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- Name: productos_sin_fk productos_sin_fk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_sin_fk
    ADD CONSTRAINT productos_sin_fk_pkey PRIMARY KEY (id);


--
-- Name: proveedores1 proveedores1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores1
    ADD CONSTRAINT proveedores1_pkey PRIMARY KEY (id);


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
-- Name: productos1 fk_proveedor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos1
    ADD CONSTRAINT fk_proveedor_id FOREIGN KEY (proveedor_id) REFERENCES public.proveedores1(id) NOT VALID;


--
-- Name: productos productos_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id);


--
-- PostgreSQL database dump complete
--

