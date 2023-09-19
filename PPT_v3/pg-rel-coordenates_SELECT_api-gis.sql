--RETORNA EM FORMATO GEOJSON TODAS AS COORDENADAS
SELECT (SELECT jsonb_build_object('type', 'Feature','geometry', ST_AsGeoJSON(atlethe.geom)::jsonb,'properties', to_jsonb( t.* )  - 'geom') AS json FROM (VALUES (atlethe.id, atlethe.name, atlethe.city, 'POINT(1 1)'::geometry)) AS t(id, name, city, geom)) FROM atlethe

--retorna os geom que tiverem dentro do quadrado
SELECT (SELECT jsonb_build_object('type', 'Feature','geometry', ST_AsGeoJSON(atlethe.geom)::jsonb,'properties', to_jsonb( t.* )  - 'geom') AS json FROM (VALUES (atlethe.id, atlethe.name, 'POINT(1 1)'::geometry)) AS t(id, name, geom)) FROM atlethe WHERE atlethe.geom && ST_MakeEnvelope({neLat}, {neLng}, {swLat}, {swLng}, 4326);

--retorna as geoms da area(coordenadas) 
SELECT (SELECT jsonb_build_object('type', 'Feature','geometry', ST_AsGeoJSON(atlethe.geom)::jsonb,'properties', to_jsonb( t.* )  - 'geom') AS json FROM (VALUES (atlethe.id, atlethe.name, 'POINT(1 1)'::geometry)) AS t(id, name, geom)) FROM atlethe WHERE atlethe.geom && ST_MakeEnvelope(-13.007813,36.315125,26.367188,57.891497, 4326); 