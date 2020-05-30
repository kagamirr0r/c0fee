class BeanTranslate < ActiveRecord::Migration[5.2]
	def change
		reversible do |dir|
      dir.up do
        Bean.create_translation_table! :country => :string, :area => :string, :variety => :string, :area => :string
      end

      dir.down do
        Bean.drop_translation_table!
      end
    end
	end
end
