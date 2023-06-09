PGDMP     ;                    {         	   viewCoins    15.2    15.2                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24586 	   viewCoins    DATABASE     �   CREATE DATABASE "viewCoins" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE "viewCoins";
                postgres    false            �            1259    24587    migration_versions    TABLE     �   CREATE TABLE public.migration_versions (
    version character varying(14) NOT NULL,
    executed_at timestamp(0) without time zone NOT NULL
);
 &   DROP TABLE public.migration_versions;
       public         heap    postgres    false                       0    0 %   COLUMN migration_versions.executed_at    COMMENT     [   COMMENT ON COLUMN public.migration_versions.executed_at IS '(DC2Type:datetime_immutable)';
          public          postgres    false    214            �            1259    24601    user    TABLE     �   CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    roles character(50),
    password character varying(500) NOT NULL,
    image character varying(500000)
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    24592    user_id_seq    SEQUENCE     t   CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false            �          0    24587    migration_versions 
   TABLE DATA           B   COPY public.migration_versions (version, executed_at) FROM stdin;
    public          postgres    false    214   =       �          0    24601    user 
   TABLE DATA           I   COPY public."user" (id, email, name, roles, password, image) FROM stdin;
    public          postgres    false    216   {                  0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 16, true);
          public          postgres    false    215            j           2606    24591 *   migration_versions migration_versions_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.migration_versions
    ADD CONSTRAINT migration_versions_pkey PRIMARY KEY (version);
 T   ALTER TABLE ONLY public.migration_versions DROP CONSTRAINT migration_versions_pkey;
       public            postgres    false    214            l           2606    24606    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    216            �   .   x�3202601�4�0�0��4ruLt-,��-�,�b���� �,M      �   .  x��нr�@ ��x
Ǳ���!���x����gb,l3N��m�Yq �yY� {�$HN|��=4�����_�?�mO�zluZ[��oqQ�z�vy'd���Vi�˸��b?�����X�51�'J�W��I�uޒ,̟R9د�ژG�Xq�q��Aij��b��/���s<-0҉��"��T2(#L3�?���3"�"�Psy�`ޜ�
9�J�5��m=�t�IU��%�Mʌ�s��Ҡ����	�Z�vT��m���O��E��,��8�Դl��K26gx�o�)�����}���     