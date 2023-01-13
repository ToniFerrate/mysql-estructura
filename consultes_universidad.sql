select apellido1, apellido2, nombre from persona where tipo='alumno' order by apellido1, apellido2, nombre;
select apellido1, apellido2, nombre from persona where telefono is null and tipo='alumno';
select * from persona where tipo='alumno' and year(fecha_nacimiento)=1999;
select * from persona where telefono is null and substring(nif,9,1)='K' and tipo='profesor';
select * from asignatura where cuatrimestre=1 and curso=3 and id_grado=7;
select apellido1, apellido2, persona.nombre, departamento.nombre as departamento from persona left join profesor on persona.id=profesor.id_profesor left join departamento on profesor.id_departamento=departamento.id order by apellido1, apellido2, persona.nombre;
select asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin from asignatura left join alumno_se_matricula_asignatura on asignatura.id=alumno_se_matricula_asignatura.id_asignatura left join curso_escolar on curso_escolar.id=alumno_se_matricula_asignatura.id_curso_escolar left join persona on persona.id=alumno_se_matricula_asignatura.id_alumno where persona.nif='26902806M';
select distinct departamento.nombre from departamento left join profesor on departamento.id=profesor.id_departamento right join asignatura on asignatura.id_grado=4 and asignatura.id_profesor=profesor.id_profesor;
select distinct apellido1, apellido2, nombre from alumno_se_matricula_asignatura left join persona on persona.id=alumno_se_matricula_asignatura.id_alumno where alumno_se_matricula_asignatura.id_curso_escolar=5;
-- Consultes utilitzant clausules LEFT JOIN i RIGHT JOIN
select departamento.nombre as departamento, apellido1, persona.apellido2, persona.nombre from persona left join profesor on persona.id=profesor.id_profesor right join departamento on departamento.id=profesor.id_departamento order by departamento, apellido1, apellido2, nombre;
select apellido1, persona.apellido2, persona.nombre from persona join profesor on (persona.id not in (select id_profesor from profesor)) and persona.tipo='profesor';
select distinct departamento.nombre as departamento from departamento right join profesor on departamento.id not in (select profesor.id_departamento from profesor);
select persona.id, apellido1, apellido2, persona.nombre from persona where persona.id not in (select distinct asignatura.id_profesor from asignatura) and persona.tipo='profesor';
select asignatura.nombre from asignatura where asignatura.id_profesor is null order by nombre;
select distinct departamento.nombre from departamento left join profesor on departamento.id=profesor.id_departamento left join asignatura on asignatura.id_profesor not in (select profesor.id_profesor from profesor) left join alumno_se_matricula_asignatura on asignatura.id not in (select alumno_se_matricula_asignatura.id_asignatura from alumno_se_matricula_asignatura);
-- Consultes resum
select count(*) from persona where tipo='alumno';
select count(*) from persona where tipo='alumno' and year(fecha_nacimiento)=1999;
select departamento.nombre, count(profesor.id_profesor) as numero from departamento join profesor on departamento.id=profesor.id_departamento group by departamento.id order by numero desc;
select departamento.*, count(profesor.id_profesor) as numero from departamento left join profesor on departamento.id=profesor.id_departamento group by departamento.id order by numero desc;
select grado.nombre, count(asignatura.id) as numero from grado left join asignatura on grado.id=asignatura.id_grado group by grado.id order by numero desc;
select grado.nombre, count(asignatura.id) as numero from grado left join asignatura on grado.id=asignatura.id_grado group by grado.id order by numero desc limit 1;
select curso_escolar.anyo_inicio, count(alumno_se_matricula_asignatura.id_alumno) as 'nombre alumnes' from alumno_se_matricula_asignatura right join curso_escolar on alumno_se_matricula_asignatura.id_curso_escolar=curso_escolar.id group by curso_escolar.anyo_inicio;
select persona.id, persona.nombre, persona.apellido1, persona.apellido2, count(asignatura.id) as 'nombre asignatures' from persona left join profesor on persona.id=profesor.id_profesor and persona.tipo='profesor' left join asignatura on profesor.id_profesor=asignatura.id_profesor group by persona.id, persona.nombre, persona.apellido1, persona.apellido2 order by count(asignatura.id) desc;
select * from persona where tipo='alumno' order by persona.fecha_nacimiento asc limit 1;
select  persona.id, persona.nombre, persona.apellido1, persona.apellido2 from persona join profesor on persona.id=profesor.id_profesor left join asignatura on (profesor.id_profesor not in (select distinct asignatura.id_profesor from asignatura));
