# encoding: utf-8
class ChatroomCreate<%= table_name.camelize %> < ActiveRecord::Migration
	def change
		create_table(:<%= table_name %>) do |t|
			# migration_data是默认生成的字段
			<%= migration_data -%>

			# attributes存放用户输入命令带的字段
			<% attributes.each do |attribute| -%>	
				t.<%= attribute.type %> :<%= attribute.name %>
			<% end -%>

			t.timestamps
		end
	end
end
