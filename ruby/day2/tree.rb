class Tree
	attr_accessor :childeren, :node_name
	def initialize(name, childeren=[])
		@node_name = name
		@childeren = childeren
	end
	def initialize(tree={})
		@node_name = tree.keys[0]
		@childeren = tree.values[0].collect{|k,v| Tree.new({k=>v})}
	end
	def visit_all(&block)
		visit &block
		childeren.each{|c| c.visit_all &block}
	end
	
	def visit(&block)
		block.call self
	end
end
h ={"grandpa" => {"dad" => {"child1" => {}, "child2" => {}}, "uncle" => {"child3" => {}, "child4" => {}}}}
tree = Tree.new(h)
tree.visit_all{|a|  puts a.node_name}
