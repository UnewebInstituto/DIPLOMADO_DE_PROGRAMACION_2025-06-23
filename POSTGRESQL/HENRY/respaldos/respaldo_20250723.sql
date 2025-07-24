--
-- PostgreSQL database dump
--

-- Dumped from database version 17rc1
-- Dumped by pg_dump version 17rc1

-- Started on 2025-07-24 08:45:54

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
-- TOC entry 896 (class 1247 OID 60922)
-- Name: profesion; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.profesion AS ENUM (
    'SALUD',
    'EDUCACION',
    'INGENIERIA',
    'ECONOMIA',
    'SEGURIDAD',
    'RECREACION',
    'DEPORTE',
    'OTRA'
);


ALTER TYPE public.profesion OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 52342)
-- Name: contactos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contactos (
    id integer NOT NULL,
    nombre character varying(80),
    apellido character varying(80),
    fecha_nacimiento date,
    direccion text,
    telefono character varying(30),
    correo_electronico character varying(80)
);


ALTER TABLE public.contactos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 52406)
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
-- TOC entry 220 (class 1259 OID 52407)
-- Name: contactos1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contactos1 (
    id integer DEFAULT nextval('public.contactos1_id_seq'::regclass) NOT NULL,
    nombre character varying(80),
    apellido character varying(80),
    fecha_nacimiento date,
    direccion text,
    telefono character varying(30),
    correo_electronico character varying(80)
);


ALTER TABLE public.contactos1 OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 60668)
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
-- TOC entry 217 (class 1259 OID 52341)
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
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 217
-- Name: contactos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contactos_id_seq OWNED BY public.contactos.id;


--
-- TOC entry 234 (class 1259 OID 60946)
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personas (
    id integer NOT NULL,
    doc character(1),
    cedula integer,
    nombre character varying(80),
    apellido character varying(80),
    direccion text,
    actividad public.profesion DEFAULT 'OTRA'::public.profesion,
    correo_electronico character varying(80),
    fecha_nacimiento date
);


ALTER TABLE public.personas OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 60945)
-- Name: personas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personas_id_seq OWNER TO postgres;

--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 233
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personas_id_seq OWNED BY public.personas.id;


--
-- TOC entry 225 (class 1259 OID 60757)
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
-- TOC entry 224 (class 1259 OID 60756)
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
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 224
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 228 (class 1259 OID 60793)
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
-- TOC entry 227 (class 1259 OID 60792)
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
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 227
-- Name: productos_sin_fk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_sin_fk_id_seq OWNED BY public.productos_sin_fk.id;


--
-- TOC entry 222 (class 1259 OID 60704)
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
-- TOC entry 223 (class 1259 OID 60708)
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
-- TOC entry 226 (class 1259 OID 60780)
-- Name: vista_prov_prod_01; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_prov_prod_01 AS
 SELECT a.nombre AS proveedor,
    a.persona_contacto AS contacto,
    a.telefono,
    b.nombre AS producto,
    b.precio
   FROM public.proveedores a,
    public.productos b
  WHERE (b.proveedor_id = a.id);


ALTER VIEW public.vista_prov_prod_01 OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 60853)
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
-- TOC entry 229 (class 1259 OID 60813)
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
-- TOC entry 230 (class 1259 OID 60821)
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
-- TOC entry 231 (class 1259 OID 60833)
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
-- TOC entry 4693 (class 2604 OID 52345)
-- Name: contactos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos ALTER COLUMN id SET DEFAULT nextval('public.contactos_id_seq'::regclass);


--
-- TOC entry 4699 (class 2604 OID 60949)
-- Name: personas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas ALTER COLUMN id SET DEFAULT nextval('public.personas_id_seq'::regclass);


--
-- TOC entry 4697 (class 2604 OID 60760)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 4698 (class 2604 OID 60796)
-- Name: productos_sin_fk id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_sin_fk ALTER COLUMN id SET DEFAULT nextval('public.productos_sin_fk_id_seq'::regclass);


--
-- TOC entry 4873 (class 0 OID 52342)
-- Dependencies: 218
-- Data for Name: contactos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contactos (id, nombre, apellido, fecha_nacimiento, direccion, telefono, correo_electronico) FROM stdin;
1	ANA	VASQUEZ	1960-08-15	SANTA FE	0414-1234567	av@gmail.com
2	PEDRO	ALMODOVAR	1950-09-01	CARICUAO	0424-9876543	pa@gmail.com
3	SARA	SUAREZ	1990-06-20	CHACAITO	0212-6782345	ss@hotmail.com
4	YOLANDA	TORTOZA	1978-10-15	CATIA LA MAR	0412-9996543	yt@gmail.com
\.


--
-- TOC entry 4875 (class 0 OID 52407)
-- Dependencies: 220
-- Data for Name: contactos1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contactos1 (id, nombre, apellido, fecha_nacimiento, direccion, telefono, correo_electronico) FROM stdin;
\.


--
-- TOC entry 4876 (class 0 OID 60668)
-- Dependencies: 221
-- Data for Name: contactos2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contactos2 (id, nombre, apellido, fecha_nacimiento, direccion, telefono, correo_electronico) FROM stdin;
1	ANA	VASQUEZ	1960-08-15	SANTA FE	{0414-1234567,0212-9998877}	av@gmail.com
2	PEDRO	ALMODOVAR	1950-09-01	CARICUAO	{0424-9876543,0212-5556644,0412-1234567}	pa@gmail.com
3	SARA	SUAREZ	1990-06-20	CHACAITO	{0212-6782345}	ss@hotmail.com
4	YOLANDA	TORTOZA	1978-10-15	CATIA LA MAR	{0412-9996543,0212-4563728}	yt@gmail.com
5	MARLENE	FERNANDES	1976-09-20	AV. LECUNA	{0212-9871234,0414-6542323}	mf@gmail.com
6	LIBIA	COLS	1980-11-15	GUARENAS	{0212-3631234,0412-8765432,0414-7871234}	lc@gmail.com
\.


--
-- TOC entry 4884 (class 0 OID 60946)
-- Dependencies: 234
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personas (id, doc, cedula, nombre, apellido, direccion, actividad, correo_electronico, fecha_nacimiento) FROM stdin;
1	V	1234	ANA	VASQUEZ	SANTA FE	ECONOMIA	av@gmail.com	1960-08-15
2	E	8100	PEDRO	ALMODOVAR	CARICUAO	DEPORTE	pa@gmail.com	1950-09-01
3	P	9100	SARA	SUAREZ	CHACAITO	EDUCACION	ss@hotmail.com	1990-06-20
4	V	5678	YOLANDA	TORTOZA	CATIA LA MAR	SALUD	yt@gmail.com	1978-10-15
5	V	9797	LINDA	EVANS	LA CASTELLANA	OTRA	lev@hotmail.com	1975-10-20
\.


--
-- TOC entry 4880 (class 0 OID 60757)
-- Dependencies: 225
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id, proveedor_id, nombre, precio, existencia) FROM stdin;
1	1	NEVERA	500.25	6
2	1	CONGELADOR	250.75	3
3	1	LAVADORA 10KG	300.00	8
4	1	COCINA A GAS	120.00	10
5	2	CONGELADOR	275.00	5
6	2	HORNO ELECTRICO	450.00	3
7	2	LAVADORA 10KG	295.00	12
8	2	COCINA ELECTRICA	350.00	2
9	3	NEVERA	450.00	3
10	3	LAVADORA	380.00	6
11	3	COCINA A GAS	230.00	12
12	3	COCINA ELECTRICA	390.00	8
13	4	NEVERA	590.75	3
14	4	CONGELADOR	249.99	6
15	4	LAVADORA 10KG	310.00	3
16	4	COCINA A GAS	170.00	8
\.


--
-- TOC entry 4882 (class 0 OID 60793)
-- Dependencies: 228
-- Data for Name: productos_sin_fk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos_sin_fk (id, proveedor_id, nombre, precio, existencia) FROM stdin;
1	1	NEVERA	500.25	6
2	1	CONGELADOR	250.75	3
3	1	LAVADORA 10KG	300.00	8
4	5	COCINA A GAS	120.00	10
5	2	CONGELADOR	275.00	5
6	2	HORNO ELECTRICO	450.00	3
7	2	LAVADORA 10KG	295.00	12
8	6	COCINA ELECTRICA	350.00	2
9	3	NEVERA	450.00	3
10	3	LAVADORA	380.00	6
11	3	COCINA A GAS	230.00	12
12	7	COCINA ELECTRICA	390.00	8
13	4	NEVERA	590.75	3
14	4	CONGELADOR	249.99	6
15	4	LAVADORA 10KG	310.00	3
16	8	COCINA A GAS	170.00	8
\.


--
-- TOC entry 4878 (class 0 OID 60708)
-- Dependencies: 223
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores (id, nombre, direccion, correo_electronico, telefono, persona_contacto) FROM stdin;
1	GENERAL ELECTRIC	AV. LECUNA	info@ge.com	0212-5431234	ANA VASQUEZ
2	WHIRPOOL	AV. ROMULO GALLEGOS	info@whirpool.com	0212-9871234	YOLANDA TORTOZA
3	ELECTROLUX	AV. PPAL. DE LAS MERCEDES	info@electrolux.com	0212-2671234	NELLY CONTRERAS
4	LG	AV. SAN MARTIN	info@lg.com	0212-4431234	MAIBA ROMERO
9	DAMASCO	AV. FCO. DE MIRANDA	info@damasco.com	0212-2431234	RORAIMA ROJAS
10	HAIRE	AV. PPAL. DEL VALLE	info@hair.com	0212-6431234	SOFIA CHAN
\.


--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 219
-- Name: contactos1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contactos1_id_seq', 6, true);


--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 217
-- Name: contactos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contactos_id_seq', 4, true);


--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 233
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personas_id_seq', 5, true);


--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 224
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 16, true);


--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 227
-- Name: productos_sin_fk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_sin_fk_id_seq', 16, true);


--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 222
-- Name: proveedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_id_seq', 4, true);


--
-- TOC entry 4706 (class 2606 OID 52416)
-- Name: contactos1 contactos1_correo_electronico_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos1
    ADD CONSTRAINT contactos1_correo_electronico_key UNIQUE (correo_electronico);


--
-- TOC entry 4708 (class 2606 OID 52414)
-- Name: contactos1 contactos1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos1
    ADD CONSTRAINT contactos1_pkey PRIMARY KEY (id);


--
-- TOC entry 4710 (class 2606 OID 60677)
-- Name: contactos2 contactos2_correo_electronico_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos2
    ADD CONSTRAINT contactos2_correo_electronico_key UNIQUE (correo_electronico);


--
-- TOC entry 4712 (class 2606 OID 60675)
-- Name: contactos2 contactos2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos2
    ADD CONSTRAINT contactos2_pkey PRIMARY KEY (id);


--
-- TOC entry 4702 (class 2606 OID 52351)
-- Name: contactos contactos_correo_electronico_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos
    ADD CONSTRAINT contactos_correo_electronico_key UNIQUE (correo_electronico);


--
-- TOC entry 4704 (class 2606 OID 52349)
-- Name: contactos contactos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contactos
    ADD CONSTRAINT contactos_pkey PRIMARY KEY (id);


--
-- TOC entry 4718 (class 2606 OID 60762)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 4720 (class 2606 OID 60798)
-- Name: productos_sin_fk productos_sin_fk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_sin_fk
    ADD CONSTRAINT productos_sin_fk_pkey PRIMARY KEY (id);


--
-- TOC entry 4714 (class 2606 OID 60717)
-- Name: proveedores proveedores_correo_electronico_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_correo_electronico_key UNIQUE (correo_electronico);


--
-- TOC entry 4716 (class 2606 OID 60715)
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- TOC entry 4721 (class 2606 OID 60763)
-- Name: productos productos_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id);


-- Completed on 2025-07-24 08:45:55

--
-- PostgreSQL database dump complete
--

