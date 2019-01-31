component alias="UserDao@v2" {

	function getUsers() {
		return queryNew('id,title,json',
			'integer,varchar,varchar',
			[
				{
					'id' = 1,
					'title' = 'example of a number',
					'json' = '{"age":35}'
				},
				{
					'id' = 2,
					'title' = 'example of a boolean',
					'json' = '{"programmer":true}'
				},
				{
					'id' = 3,
					'title' = 'example of a struct',
					'json' = '{"name":"evagoras"}'
				},
				{
					'id' = 4,
					'title' = 'example of an array',
					'json' = '[{"name":"evagoras"},{"name":"charalambous"}]'
				}
			]
		);
	}
}