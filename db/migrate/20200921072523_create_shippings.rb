class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string     :postcode,          default: "",  null: false
      t.integer    :state_id,          null: false
      t.string     :city,              default: "",  null: false
      t.string     :add_line,          default: "",  null: false
      t.string     :building
      t.string     :phone_number,      default: "",  null: false
      t.references :purchase,          null: false,  foreign_key: true

      t.timestamps
    end
  end
end
