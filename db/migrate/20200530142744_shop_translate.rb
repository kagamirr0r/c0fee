class ShopTranslate < ActiveRecord::Migration[5.2]
	def change
		reversible do |dir|
      dir.up do
        Shop.create_translation_table! :name => :string, :address => :string
      end

      dir.down do
        Shop.drop_translation_table!
      end
    end
  end
end
