class CreateRepoAccessRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :repo_access_requests do |t|
      t.references :user, foreign_key: true
      t.text :repository
      t.text :repo_group
      t.string :level
      t.string :request_action

      t.timestamps
    end
  end
end
