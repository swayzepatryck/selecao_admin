module SelecaoAdmin
  module EnrollmentsHelper
    def lecture_object(f)
      if action_name == 'new'
        return SelecaoAdmin::Lecture.new
      elsif action_name == 'edit'
        return f.object.lecture
      end
    end
    
    def get_enrolleds_drawn(enrollment_id, student_quota_id)
      SelecaoAdmin::EnrollmentEnrolled.find_by_sql(
				%Q(
					select inscrito.* from selecao_admin_drawing_enrolleds sorteado, selecao_admin_drawings sorteio, selecao_admin_enrollments inscricao, selecao_admin_enrollment_enrolleds inscrito
						where sorteado.drawing_id = sorteio.id 
							and sorteio.enrollment_id = inscricao.id 
								and inscricao.id = #{enrollment_id}
									and sorteado.enrolled_id = inscrito.enrolled_id
										and sorteio.enrollment_id = inscrito.enrollment_id
										  and student_quota_id = #{student_quota_id}
												order by sorteado.id
				)
			)
    end
    
    def get_enrolleds_drawn_count
        SelecaoAdmin::EnrollmentEnrolled.find_by_sql(%Q(
          select sorteado.drawing_id, inscrito.student_quota_id, count(*) as counter from selecao_admin_drawing_enrolleds sorteado, selecao_admin_drawings sorteio, selecao_admin_enrollments inscricao, selecao_admin_enrollment_enrolleds inscrito
  						where sorteado.drawing_id = sorteio.id 
  							and sorteio.enrollment_id = inscricao.id 
  								and inscricao.id = #{@enrollment.id}
  									and sorteado.enrolled_id = inscrito.enrolled_id
  										and sorteio.enrollment_id = inscrito.enrollment_id
  											group by inscrito.student_quota_id, sorteado.drawing_id   
  											  order by inscrito.student_quota_id
        ))        
    end
    
    def get_number_of_vacancies(drawing_id, student_quota_id)
      DrawingStudentQuota.where(:drawing_id => drawing_id).where(:student_quota_id => student_quota_id).first
    end
  end
end
