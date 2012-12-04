module SelecaoAdmin
  module DrawingsHelper
    def enrollments_without_drawing
      enrollments = Array.new
      SelecaoAdmin::Enrollment.order(:id).each do |enrollment|
        if enrollment.try(:drawing)
        else
          enrollments << enrollment
        end
      end
      enrollments
    end
    
    
    def get_drawn_count
        SelecaoAdmin::EnrollmentEnrolled.find_by_sql(%Q(
          select sorteado.drawing_id, inscrito.student_quota_id, count(*) as counter from selecao_admin_drawing_enrolleds sorteado, selecao_admin_drawings sorteio, selecao_admin_enrollments inscricao, selecao_admin_enrollment_enrolleds inscrito
  						where sorteado.drawing_id = sorteio.id 
  							and sorteio.enrollment_id = inscricao.id 
  								and inscricao.id = #{@drawing.enrollment.id}
  									and sorteado.enrolled_id = inscrito.enrolled_id
  										and sorteio.enrollment_id = inscrito.enrollment_id
  											group by inscrito.student_quota_id, sorteado.drawing_id   
  											  order by inscrito.student_quota_id
        ))        
    end
    
    def left_vacancies(pos, cee)
      number_of_vacancies = get_number_of_vacancies(cee.drawing_id, cee.student_quota_id).number_of_vacancies
      (number_of_vacancies - (pos - 1)) > 0 ? number_of_vacancies - (pos - 1) : '0'
    end
    
    def get_number_of_vacancies(drawing_id, student_quota_id)
      DrawingStudentQuota.where(:drawing_id => drawing_id).where(:student_quota_id => student_quota_id).first
    end   
    
  end
end
