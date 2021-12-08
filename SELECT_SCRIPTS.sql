select 	s.first_name, 
		s.second_name, 
		s.last_name, 
		e.exam_name, 
		q.question, 
		selected_option_number, 
		a.option_number as correct_option_number 
from results r
	join students s
	on s.id = r.student_id
	join exams e
	on e.id = r.exam_id
	join questions q
	on q.id = r.question_id
	join answers a
	on a.question_id = r.question_id
where is_correct = true



select 	s.first_name, 
		s.second_name, 
		s.last_name, 
		e.exam_name,
		es.estimation 
from exam_estimations es
join students s
	on s.id = es.student_id
	join exams e
	on e.id = es.exam_id