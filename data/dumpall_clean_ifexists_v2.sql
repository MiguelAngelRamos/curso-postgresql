--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE IF EXISTS laboratorio;
DROP DATABASE IF EXISTS recetas;


--
-- Drop tablespaces
--

DROP TABLESPACE IF EXISTS tbs_lab;
DROP TABLESPACE IF EXISTS tbs_recetas;


--
-- Drop roles
--

DROP ROLE IF EXISTS laboratorio;
DROP ROLE IF EXISTS myuser;
DROP ROLE IF EXISTS postgres;


--
-- Roles
--

CREATE ROLE laboratorio;
ALTER ROLE laboratorio WITH NOSUPERUSER INHERIT NOCREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md5d3e7e7ca22fc16df20f9bf9e9b8370d5';
CREATE ROLE myuser;
ALTER ROLE myuser WITH NOSUPERUSER INHERIT CREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md53e1baa237e222045f71e5edc9ff33b16';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md53ea3ea8f2e5689e2c3ae53c900109597';




--
-- Tablespaces
--

CREATE TABLESPACE tbs_recetas OWNER myuser LOCATION '/var/lib/postgresql/12/tbs_recetas';
CREATE TABLESPACE tbs_lab OWNER laboratorio LOCATION '/var/lib/postgresql/12/tbs_lab';


--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "laboratorio" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)

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

--
-- Name: laboratorio; Type: DATABASE; Schema: -; Owner: laboratorio
--

CREATE DATABASE laboratorio WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8' TABLESPACE = tbs_lab;


ALTER DATABASE laboratorio OWNER TO laboratorio;

\connect laboratorio

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

--
-- Name: sch_lab; Type: SCHEMA; Schema: -; Owner: laboratorio
--

CREATE SCHEMA sch_lab;


ALTER SCHEMA sch_lab OWNER TO laboratorio;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tab_prueba_1; Type: TABLE; Schema: sch_lab; Owner: laboratorio
--

CREATE TABLE sch_lab.tab_prueba_1 (
    id smallint
);


ALTER TABLE sch_lab.tab_prueba_1 OWNER TO laboratorio;

--
-- Name: tab_prueba_2; Type: TABLE; Schema: sch_lab; Owner: postgres
--

CREATE TABLE sch_lab.tab_prueba_2 (
    id numeric
);


ALTER TABLE sch_lab.tab_prueba_2 OWNER TO postgres;

--
-- Data for Name: tab_prueba_1; Type: TABLE DATA; Schema: sch_lab; Owner: laboratorio
--

COPY sch_lab.tab_prueba_1 (id) FROM stdin;
\.


--
-- Data for Name: tab_prueba_2; Type: TABLE DATA; Schema: sch_lab; Owner: postgres
--

COPY sch_lab.tab_prueba_2 (id) FROM stdin;
3
4
5
6
7
8
7
5
4
4
6
2
4
4
4
5
5
6
7
8
\.


--
-- Name: SCHEMA sch_lab; Type: ACL; Schema: -; Owner: laboratorio
--

GRANT USAGE ON SCHEMA sch_lab TO myuser WITH GRANT OPTION;


--
-- Name: TABLE tab_prueba_1; Type: ACL; Schema: sch_lab; Owner: laboratorio
--

GRANT SELECT ON TABLE sch_lab.tab_prueba_1 TO myuser WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "recetas" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)

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

--
-- Name: recetas; Type: DATABASE; Schema: -; Owner: myuser
--

CREATE DATABASE recetas WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE recetas OWNER TO myuser;

\connect recetas

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

--
-- Name: DATABASE recetas; Type: COMMENT; Schema: -; Owner: myuser
--

COMMENT ON DATABASE recetas IS 'Base de datos para almacenar recetas vegetarianas.';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ingredientes; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.ingredientes (
    id_ingrediente integer NOT NULL,
    ingrediente character varying(50) NOT NULL
);


ALTER TABLE public.ingredientes OWNER TO myuser;

--
-- Name: TABLE ingredientes; Type: COMMENT; Schema: public; Owner: myuser
--

COMMENT ON TABLE public.ingredientes IS 'Ingredientes que se utilizan en la elaboración de recetas.';


--
-- Name: ingredientes_id_ingrediente_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.ingredientes_id_ingrediente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredientes_id_ingrediente_seq OWNER TO myuser;

--
-- Name: ingredientes_id_ingrediente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.ingredientes_id_ingrediente_seq OWNED BY public.ingredientes.id_ingrediente;


--
-- Name: medidas; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.medidas (
    id_medida integer NOT NULL,
    medida character varying(10) NOT NULL
);


ALTER TABLE public.medidas OWNER TO myuser;

--
-- Name: TABLE medidas; Type: COMMENT; Schema: public; Owner: myuser
--

COMMENT ON TABLE public.medidas IS 'Medidas utilizadas para contabilizar la cantidad de un ingrediente.';


--
-- Name: medidas_id_medida_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.medidas_id_medida_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medidas_id_medida_seq OWNER TO myuser;

--
-- Name: medidas_id_medida_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.medidas_id_medida_seq OWNED BY public.medidas.id_medida;


--
-- Name: receta_ingredientes; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.receta_ingredientes (
    id_receta smallint NOT NULL,
    id_ingrediente smallint NOT NULL,
    cantidad smallint NOT NULL,
    id_medida smallint NOT NULL
);


ALTER TABLE public.receta_ingredientes OWNER TO myuser;

--
-- Name: TABLE receta_ingredientes; Type: COMMENT; Schema: public; Owner: myuser
--

COMMENT ON TABLE public.receta_ingredientes IS 'Ingredientes que se necesitan para cada receta.';


--
-- Name: receta_preparacion; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.receta_preparacion (
    id_receta smallint NOT NULL,
    num_paso smallint NOT NULL,
    descripcion character varying(250) NOT NULL
);


ALTER TABLE public.receta_preparacion OWNER TO myuser;

--
-- Name: TABLE receta_preparacion; Type: COMMENT; Schema: public; Owner: myuser
--

COMMENT ON TABLE public.receta_preparacion IS 'Pasos a realizar durante la preparación de la receta.';


--
-- Name: receta_tipos; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.receta_tipos (
    id_receta smallint NOT NULL,
    id_tipo smallint NOT NULL
);


ALTER TABLE public.receta_tipos OWNER TO myuser;

--
-- Name: TABLE receta_tipos; Type: COMMENT; Schema: public; Owner: myuser
--

COMMENT ON TABLE public.receta_tipos IS 'Tipos de recetas en las que se puede englobar una receta.';


--
-- Name: recetas; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.recetas (
    id_receta integer NOT NULL,
    nombre character varying(150) NOT NULL,
    comensales smallint,
    tpo_preparacion time without time zone,
    tpo_elaboracion time without time zone,
    referencia character varying(1000)
);


ALTER TABLE public.recetas OWNER TO myuser;

--
-- Name: TABLE recetas; Type: COMMENT; Schema: public; Owner: myuser
--

COMMENT ON TABLE public.recetas IS 'Recetas vegetarianas';


--
-- Name: recetas_id_receta_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.recetas_id_receta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recetas_id_receta_seq OWNER TO myuser;

--
-- Name: recetas_id_receta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.recetas_id_receta_seq OWNED BY public.recetas.id_receta;


--
-- Name: tipos_corte; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.tipos_corte (
    id_corte integer NOT NULL,
    descripcion character varying(50) NOT NULL
);


ALTER TABLE public.tipos_corte OWNER TO myuser;

--
-- Name: TABLE tipos_corte; Type: COMMENT; Schema: public; Owner: myuser
--

COMMENT ON TABLE public.tipos_corte IS 'Define los tipos de corte que se pueden emplear para preparar un ingrediente de la receta.';


--
-- Name: tipos_corte_id_corte_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.tipos_corte_id_corte_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipos_corte_id_corte_seq OWNER TO myuser;

--
-- Name: tipos_corte_id_corte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.tipos_corte_id_corte_seq OWNED BY public.tipos_corte.id_corte;


--
-- Name: tipos_receta; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.tipos_receta (
    id_tipo integer NOT NULL,
    tipo_receta character varying(50) NOT NULL
);


ALTER TABLE public.tipos_receta OWNER TO myuser;

--
-- Name: TABLE tipos_receta; Type: COMMENT; Schema: public; Owner: myuser
--

COMMENT ON TABLE public.tipos_receta IS 'Tipos de recetas.';


--
-- Name: tipos_receta_id_tipo_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.tipos_receta_id_tipo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipos_receta_id_tipo_seq OWNER TO myuser;

--
-- Name: tipos_receta_id_tipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.tipos_receta_id_tipo_seq OWNED BY public.tipos_receta.id_tipo;


--
-- Name: ingredientes id_ingrediente; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.ingredientes ALTER COLUMN id_ingrediente SET DEFAULT nextval('public.ingredientes_id_ingrediente_seq'::regclass);


--
-- Name: medidas id_medida; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.medidas ALTER COLUMN id_medida SET DEFAULT nextval('public.medidas_id_medida_seq'::regclass);


--
-- Name: recetas id_receta; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.recetas ALTER COLUMN id_receta SET DEFAULT nextval('public.recetas_id_receta_seq'::regclass);


--
-- Name: tipos_corte id_corte; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.tipos_corte ALTER COLUMN id_corte SET DEFAULT nextval('public.tipos_corte_id_corte_seq'::regclass);


--
-- Name: tipos_receta id_tipo; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.tipos_receta ALTER COLUMN id_tipo SET DEFAULT nextval('public.tipos_receta_id_tipo_seq'::regclass);


--
-- Data for Name: ingredientes; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.ingredientes (id_ingrediente, ingrediente) FROM stdin;
1	aceite
2	sal
3	pimienta
4	agua
5	aguacate
6	queso de untar
7	limón
8	calabacín
9	pepino
10	diente de ajo
11	cebolla
12	vinagre
13	migas de pan
14	nata para cocinar
15	fresas
16	aceite de lino
17	sirope de ágave
18	vinagre de manzana
19	cebolla morada
20	mix de lechugas
21	orégano
22	semillas de sésamo
23	garbanzos cocidos
24	setas
25	azafrán
26	eneldo
27	caldo de verduras
28	queso brie
\.


--
-- Data for Name: medidas; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.medidas (id_medida, medida) FROM stdin;
1	gramos
2	mililitros
3	litros
4	unidad
5	chorrito
6	pizca
7	cucharada
\.


--
-- Data for Name: receta_ingredientes; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.receta_ingredientes (id_receta, id_ingrediente, cantidad, id_medida) FROM stdin;
1	5	1	4
1	6	150	1
1	7	1	5
1	2	1	6
1	3	1	6
64	5	3	4
64	8	1	4
64	9	1	4
64	10	1	4
64	11	1	4
64	1	4	7
64	12	1	5
64	13	50	1
64	14	200	2
64	2	1	6
64	3	1	6
2	15	150	1
2	1	1	7
2	16	1	7
2	17	2	7
2	18	1	7
2	2	1	6
2	3	1	6
2	19	1	4
2	5	1	4
2	20	300	1
2	21	1	6
2	22	4	7
3	23	400	1
3	11	1	4
3	24	250	1
3	27	100	2
3	28	50	1
3	1	1	7
3	2	1	6
3	3	2	6
3	25	1	6
3	26	1	6
\.


--
-- Data for Name: receta_preparacion; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.receta_preparacion (id_receta, num_paso, descripcion) FROM stdin;
1	1	Mezclar todos los ingredientes y batir hasta conseguir una textura fina.
1	2	Reservar en el frigorífico hasta el momento de consumir.
64	1	Poner en el vaso de la batidora los aguacates, el calabacín, el pepino, la cebolla y el diente de ajo, todo pelado y troceado.
64	2	Añadir la miga de pan remojada en agua, la nata, un chorrito de vinagre, aceite de oliva, pimienta negra y sal
64	3	Trituramos y añadimos agua al gusto hasta obtener la textura deseada.
64	4	Rectificamos de sal y reservamos en el frigorífico hasta el momento de servir.
2	1	Triturar las fresas con el aceite de oliva, el aceite de lino, el sirope de ágave, el vinagre de manzana, la sal y la pimienta. Reservar.
2	3	Mezclar la lechuga con la cebolla morada cortada a medias lunas lo más finas posible.
2	4	Agregar a la ensalada la vinagreta de fresas que teníamos reservada.
2	5	Añadir el aguacate troceado y mezclar bien.
2	6	Servir espolvoreada con el sésamo tostado que teníamos reservado y el orégano.
2	2	Tostar las semillas de sésamo en un sartén a fuego medio, removiendo constantemente hasta que empiecen a dorarse. Dejar enfriar y reservar.
3	1	Pochar la cebolla en aceite de oliva.
3	2	Añadir las setas troceadas y dorar.
3	3	Añadir los garbanzos cocidos con todo su caldo.
3	4	Añade el caldo de verduras y deja cocer todo junto unos minutos.
3	5	Añade el queso brie en trocitos y remueve hasta que se derrita y se mezcle con el resto de ingredientes.
3	6	Añade azafrán, sal y pimienta. Prueba y rectifica.
3	7	Sirve con hojas de eneldo y un poco más de pimienta por encima.
\.


--
-- Data for Name: receta_tipos; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.receta_tipos (id_receta, id_tipo) FROM stdin;
1	3
1	8
2	3
3	2
3	6
\.


--
-- Data for Name: recetas; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.recetas (id_receta, nombre, comensales, tpo_preparacion, tpo_elaboracion, referencia) FROM stdin;
1	Crema de aguacate y queso	4	\N	\N	\N
4	Arroz con setas, algas y miso	\N	\N	\N	\N
5	Sopa de judías mungo	\N	\N	\N	\N
6	Lentejas al curry	\N	\N	\N	\N
7	Curry de verduras	\N	\N	\N	\N
8	Garbanzos con setas	\N	\N	\N	\N
9	Potaje de acelgas	\N	\N	\N	\N
10	Wok de verduras con fideos de arroz	\N	\N	\N	\N
11	Potaje de alubias con calabaza	\N	\N	\N	\N
12	Cuscus de verduras	\N	\N	\N	\N
13	Salteado de lentejas con hinojo	\N	\N	\N	\N
14	Cuscus de brócoli	\N	\N	\N	\N
15	Tallarines a la puttanesca	\N	\N	\N	\N
16	Crep vegetariano	\N	\N	\N	\N
17	Croquetas vegetarianas	\N	\N	\N	\N
18	Tallarines de shiitake y coco	\N	\N	\N	\N
19	Paella de verduras	\N	\N	\N	\N
20	Tortilla de pencas	\N	\N	\N	\N
21	Morcilla vegetariana	\N	\N	\N	\N
22	Hummus de lentejas rojas	\N	\N	\N	\N
23	Rollitos de berenjena con nueces	\N	\N	\N	\N
24	Sopa de calabaza	\N	\N	\N	\N
25	Ceviche de mango y granada	\N	\N	\N	\N
26	Ensalada de chucrut	\N	\N	\N	\N
27	Lasaña crudivegana	\N	\N	\N	\N
28	Migas de calabaza	\N	\N	\N	\N
29	Crema dulce de puerro y pera	\N	\N	\N	\N
30	Brócoli con salsa de piñones	\N	\N	\N	\N
31	Creps de espárragos trigueros y setas	\N	\N	\N	\N
32	Sopa de miso	\N	\N	\N	\N
33	Sobrasada vegana	\N	\N	\N	\N
34	Pan de trigo sarraceno	\N	\N	\N	\N
35	Crackers de lino	\N	\N	\N	\N
36	Panecillos integrales	\N	\N	\N	\N
37	Vinagreta de pistachos	\N	\N	\N	\N
38	Vinagreta de fresas	\N	\N	\N	\N
39	Pizza con base de garbanzos	\N	\N	\N	\N
40	Pizza con base de coliflor	\N	\N	\N	\N
41	Pizza con base de brócoli	\N	\N	\N	\N
42	Salsa de "queso" (calabaza)	\N	\N	\N	\N
43	Salsa de "queso" (anacardos)	\N	\N	\N	\N
44	Flan de chocolate y mijo	\N	\N	\N	\N
45	Tarta de manzana	\N	\N	\N	\N
46	Tableta de chocolate de invierno	\N	\N	\N	\N
47	Brownie de garbanzos	\N	\N	\N	\N
48	Cookies de macadamia y chocolate	\N	\N	\N	\N
49	Flan de huevo	\N	\N	\N	\N
50	Helado de menta y chocolate	\N	\N	\N	\N
51	Helado de fresa	\N	\N	\N	\N
52	Tapioca con leche de coco	\N	\N	\N	\N
53	Bizcocho de zanahoria	\N	\N	\N	\N
54	Tartaletas de espinacas	\N	\N	\N	\N
55	Empanadillas de verduras	\N	\N	\N	\N
56	Sal de algas	\N	\N	\N	\N
57	Sal de apio	\N	\N	\N	\N
58	Leche vegetal de almendras	\N	\N	\N	\N
59	Batido de chocolate	\N	\N	\N	\N
60	Horchata de chufa	\N	\N	\N	\N
61	Paté de setas shiitake	\N	\N	\N	\N
62	Paté de alcachofas	\N	\N	\N	\N
63	Queso de untar vegano	\N	\N	\N	\N
64	Gazpacho de aguacate	\N	\N	\N	\N
2	Ensalada fresca con vinagreta de fresas	\N	\N	\N	Venu Sanz Chef
3	Garbanzos con setas y queso brie	\N	\N	\N	https://www.youtube.com/watch?v=ItGkpmMvYzM
\.


--
-- Data for Name: tipos_corte; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.tipos_corte (id_corte, descripcion) FROM stdin;
1	Trozos grandes
2	Trozos medianos
3	Trozos pequeños
4	Picado fino
5	Juliana
6	Rallado
7	Entero
\.


--
-- Data for Name: tipos_receta; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.tipos_receta (id_tipo, tipo_receta) FROM stdin;
1	Desayunos
2	Comidas principales
3	Comidas ligeras o cenas
4	Bebidas vegetales
5	Postres
6	Legumbres
7	Cereales o pseudocereales
8	Cremas, pastas y patés
9	Panes y crackers
\.


--
-- Name: ingredientes_id_ingrediente_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.ingredientes_id_ingrediente_seq', 1, false);


--
-- Name: medidas_id_medida_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.medidas_id_medida_seq', 1, false);


--
-- Name: recetas_id_receta_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.recetas_id_receta_seq', 1, false);


--
-- Name: tipos_corte_id_corte_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.tipos_corte_id_corte_seq', 7, true);


--
-- Name: tipos_receta_id_tipo_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.tipos_receta_id_tipo_seq', 9, true);


--
-- Name: ingredientes ingredientes_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.ingredientes
    ADD CONSTRAINT ingredientes_pkey PRIMARY KEY (id_ingrediente);


--
-- Name: medidas medidas_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.medidas
    ADD CONSTRAINT medidas_pkey PRIMARY KEY (id_medida);


--
-- Name: receta_tipos pk_recetas_tipo; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.receta_tipos
    ADD CONSTRAINT pk_recetas_tipo PRIMARY KEY (id_receta, id_tipo);


--
-- Name: receta_ingredientes receta_ingredientes_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.receta_ingredientes
    ADD CONSTRAINT receta_ingredientes_pkey PRIMARY KEY (id_receta, id_ingrediente);


--
-- Name: receta_preparacion receta_preparacion_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.receta_preparacion
    ADD CONSTRAINT receta_preparacion_pkey PRIMARY KEY (id_receta, num_paso);


--
-- Name: recetas recetas_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.recetas
    ADD CONSTRAINT recetas_pkey PRIMARY KEY (id_receta);


--
-- Name: tipos_corte tipos_corte_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.tipos_corte
    ADD CONSTRAINT tipos_corte_pkey PRIMARY KEY (id_corte);


--
-- Name: tipos_receta tipos_receta_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.tipos_receta
    ADD CONSTRAINT tipos_receta_pkey PRIMARY KEY (id_tipo);


--
-- Name: receta_ingredientes receta_ingredientes_fk_ingredientes; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.receta_ingredientes
    ADD CONSTRAINT receta_ingredientes_fk_ingredientes FOREIGN KEY (id_ingrediente) REFERENCES public.ingredientes(id_ingrediente) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: receta_ingredientes receta_ingredientes_fk_medida; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.receta_ingredientes
    ADD CONSTRAINT receta_ingredientes_fk_medida FOREIGN KEY (id_medida) REFERENCES public.medidas(id_medida) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: receta_ingredientes receta_ingredientes_fk_receta; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.receta_ingredientes
    ADD CONSTRAINT receta_ingredientes_fk_receta FOREIGN KEY (id_receta) REFERENCES public.recetas(id_receta) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: receta_tipos receta_tipos_fk_receta; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.receta_tipos
    ADD CONSTRAINT receta_tipos_fk_receta FOREIGN KEY (id_receta) REFERENCES public.recetas(id_receta) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: receta_tipos receta_tipos_fk_tipos; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.receta_tipos
    ADD CONSTRAINT receta_tipos_fk_tipos FOREIGN KEY (id_tipo) REFERENCES public.tipos_receta(id_tipo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

