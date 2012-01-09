require_relative '../test_helper'

describe Node do
  it 'has a root node' do
    root_node = Node.create description: 'root node'
    subnode = Node.create description: 'subnode', parent: root_node
    subsubnode = Node.create description: 'subsubnode', parent: subnode

    subsubnode.root_node.must_equal root_node
  end
end
