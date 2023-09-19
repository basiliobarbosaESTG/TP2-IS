CREATE TABLE public.event (
	id              uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
	event          VARCHAR(250) NOT NULL,
	created_on      TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_on      TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE public.atlethe (
	id              uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
	name            VARCHAR(250) NOT NULL,
	sex             VARCHAR(250) NOT NULL,
	age            	VARCHAR(250) NOT NULL,
	height          VARCHAR(250) NOT NULL,
	weight          VARCHAR(250) NOT NULL,
	team            VARCHAR(250) NOT NULL,
	noc        	    VARCHAR(250) NOT NULL,
	games           VARCHAR(250) NOT NULL,
	year            VARCHAR(250) NOT NULL,
	season          VARCHAR(250) NOT NULL,
	city            VARCHAR(250) NOT NULL,
	lat         	VARCHAR(250) NOT NULL,
	lon             VARCHAR(250) NOT NULL,
	sport           VARCHAR(250) NOT NULL,
	event           VARCHAR(250) NOT NULL,
	medal           VARCHAR(250) NOT NULL,
	geom            GEOMETRY,
	event_id 		uuid,
	created_on      TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_on      TIMESTAMP NOT NULL DEFAULT NOW()
);

ALTER TABLE atlethe
    ADD CONSTRAINT atlethe_event_id_fk
        FOREIGN KEY (event_id) REFERENCES event
            ON DELETE SET NULL;