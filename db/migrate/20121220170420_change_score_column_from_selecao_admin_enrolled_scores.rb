class ChangeScoreColumnFromSelecaoAdminEnrolledScores < ActiveRecord::Migration
  def self.up
    change_table :selecao_admin_enrolled_scores do |t|
      t.change :score, :decimal, :precision => 8, :scale => 2
    end
  end

  def self.down
    change_table :widgets do |t|
      t.change :score, :float
    end
  end
end
