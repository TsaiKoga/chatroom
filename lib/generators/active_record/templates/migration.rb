# encoding: utf-8
class ChatroomCreate<%= table_name.camelize %> < ActiveRecord::Migration
	def change
		create_table(:<%= table_name %>) do |t|
			<%= migration_data -%>

			<% attributes.each do |attribute| -%>	
				t.<%= attribute.type %> :<%= attribute.name %>
			<% end -%>

			t.timestamps
		end
	end
end
