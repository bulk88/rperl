package RPerl::DataStructure::Graph::Tree::Binary::Node;
use strict;
use warnings;
use RPerl::AfterSubclass;
our $VERSION = 0.001_000;

package RPerl::DataStructure::Graph::Tree::Binary::NodeReference;
use parent qw(RPerl::DataType::Modifier::Reference);
use RPerl::DataType::Modifier::Reference;

# coderef parameter accepted by traverse method(s)
use RPerl::Code;

# must include here because we do not inherit data types
use RPerl::DataType::Unknown;
use RPerl::DataStructure::Array;
use RPerl::CodeBlock::Subroutine::Method;

our hashref $properties =
{
	data => my unknown $TYPED_data = undef,
	left => my RPerl::DataStructure::Graph::Tree::Binary::NodeReference $TYPED_left = undef,
	right => my RPerl::DataStructure::Graph::Tree::Binary::NodeReference $TYPED_right = undef
};

# traverse nodes breadth-first
sub traverse_breadthfirst_queue {
    { my unknown::method $RETURN_TYPE };
    (my RPerl::DataStructure::Graph::Tree::Binary::NodeReference $self, my RPerl::CodeReference $callback) = @ARG;
	RPerl::diag("in ...Tree::Binary::NodeReference::traverse_breadthfirst_queue(), received \$self = \n" . RPerl::DUMPER($self) . "\n");
	my @return_value = ();
	my $return_value_tmp;
	my @queue = ();
	my RPerl::DataStructure::Graph::Tree::Binary::NodeReference $node;
	
	unshift(@queue, $self);
	
	RPerl::diag("in ...Tree::Binary::NodeReference::traverse_breadthfirst_queue(), before while() loop have \@queue = \n" . RPerl::DUMPER(\@queue) . "\n");
	
	while (scalar(@queue) > 0)
	{
		$node = pop(@queue);
		RPerl::diag("in ...Tree::Binary::NodeReference::traverse_breadthfirst_queue(), top of while() loop have \$node = \n" . RPerl::DUMPER($node) . "\n");
	
		$return_value_tmp = &{$callback}($node);
		push(@return_value, $return_value_tmp) if (defined($return_value_tmp));  # do not include undef values
		
		RPerl::diag("in ...Tree::Binary::NodeReference::traverse_breadthfirst_queue(), inside while() loop, after callback have \@return_value = \n" . RPerl::DUMPER(\@return_value) . "\n");
		
		unshift(@queue, $node->{left}) if (defined($node->{left}));
		unshift(@queue, $node->{right}) if (defined($node->{right}));
		RPerl::diag("in ...Tree::Binary::NodeReference::traverse_breadthfirst_queue(), bottom of while() loop, have \@queue = \n" . RPerl::DUMPER(\@queue) . "\n");
	}

    return;
}

# traverse nodes depth-first in pre-order
sub traverse_depthfirst_preorder {
    { my unknown::method $RETURN_TYPE };
    (my RPerl::DataStructure::Graph::Tree::Binary::NodeReference $self, my RPerl::CodeReference $callback) = @ARG;
	RPerl::diag("in ...Tree::Binary::NodeReference::traverse_depthfirst_preorder(), received \$self = \n" . RPerl::DUMPER($self) . "\n");
#	RPerl::diag("in ...Tree::Binary::NodeReference::traverse_depthfirst_preorder(), received \$callback = " . RPerl::DUMPER($callback) . "\n");
	my @return_value = ();
	my unknown $return_value_tmp = undef;
	
	# callback on self
	$return_value_tmp = &{$callback}($self);
	push(@return_value, $return_value_tmp) if (defined($return_value_tmp));  # do not include undef values
	RPerl::diag("in ...Tree::Binary::NodeReference::traverse_depthfirst_preorder(), after callback on \$self have \@return_value = \n" . RPerl::DUMPER(\@return_value) . "\n");
	
	# possibly recurse on left
	if (defined($self->{left}))
	{
		if (ref(\$self->{left}) eq 'SCALAR') { $return_value_tmp = &{$callback}($self->{left});  push(@return_value, $return_value_tmp); }
		else { $return_value_tmp = $self->{left}->traverse_depthfirst_preorder($callback);  @return_value = (@return_value, @{$return_value_tmp}); }
	}
	RPerl::diag("in ...Tree::Binary::NodeReference::traverse_depthfirst_preorder(), after (possible recurse on) \$self->{left} have \@return_value = \n" . RPerl::DUMPER(\@return_value) . "\n");
	
	# possibly recurse on right
	if (defined($self->{right}))
	{
		if (ref(\$self->{right}) eq 'SCALAR') { $return_value_tmp = &{$callback}($self->{right});  push(@return_value, $return_value_tmp); }
		else { $return_value_tmp = $self->{right}->traverse_depthfirst_preorder($callback);  @return_value = (@return_value, @{$return_value_tmp}); }
	}
	RPerl::diag("in ...Tree::Binary::NodeReference::traverse_depthfirst_preorder(), after (possible recurse on) \$self->{right} have \@return_value = \n" . RPerl::DUMPER(\@return_value) . "\n");
    return \@return_value;
}

# accept binary tree nodes, return nested array refs;
# modified pre-order traversal to achieve the opposite of new_from_nested_arrayrefs()
sub to_nested_arrayrefs {
    { my unknown::method $RETURN_TYPE };
    (my RPerl::DataStructure::Graph::Tree::Binary::NodeReference $self) = @ARG;
#	RPerl::diag("in ...Tree::Binary::NodeReference::to_nested_arrayrefs(), received \$self = \n" . RPerl::DUMPER($self) . "\n");
	my arrayref $return_value = [];
	my arrayref $return_value_children = [];
	$return_value->[1] = $return_value_children;
	
	$return_value->[0] = $self->{data};  # do include undef values
#	RPerl::diag("in ...Tree::Binary::NodeReference::to_nested_arrayrefs(), after callback on \$self have \$return_value = \n" . RPerl::DUMPER($return_value) . "\n");
	
	# possibly recurse on left
	if (defined($self->{left}))
	{
		if (ref(\$self->{left}) eq 'SCALAR') { $return_value_children->[0] = $self->{left}; }
		else { $return_value_children->[0] = $self->{left}->to_nested_arrayrefs(); }
	}
	else { $return_value_children->[0] = undef; }
#	RPerl::diag("in ...Tree::Binary::NodeReference::to_nested_arrayrefs(), after (possible recurse on) \$self->{left} have \$return_value = \n" . RPerl::DUMPER($return_value) . "\n");
	
	# possibly recurse on right
	if (defined($self->{right}))
	{
		if (ref(\$self->{right}) eq 'SCALAR') { $return_value_children->[1] = $self->{right}; }
		else { $return_value_children->[1] = $self->{right}->to_nested_arrayrefs(); }
	}
	else { $return_value_children->[1] = undef; }
#	RPerl::diag("in ...Tree::Binary::NodeReference::to_nested_arrayrefs(), after (possible recurse on) \$self->{right} have \$return_value = \n" . RPerl::DUMPER($return_value) . "\n");
    return $return_value;
}

# accept nested array refs, return binary tree nodes
sub new_from_nested_arrayrefs {
    { my RPerl::DataStructure::Graph::Tree::Binary::NodeReference $RETURN_TYPE };
    (my string $class, my arrayref $input) = @ARG;
#	RPerl::diag("in ...Tree::Binary::NodeReference::new_from_nested_arrayrefs(), received \$class = '$class', and \$input =\n" . RPerl::DUMPER($input) . "\n");
	my unknown $output = $class->new();

	$output->{data} = $input->[0];
	
	if (ref($input->[1]->[0]) eq 'ARRAY') { $output->{left} = $class->new_from_nested_arrayrefs($input->[1]->[0]); }
	else { $output->{left} = $input->[1]->[0]; }
	
	if (ref($input->[1]->[1]) eq 'ARRAY') { $output->{right} = $class->new_from_nested_arrayrefs($input->[1]->[1]); }
	else { $output->{right} = $input->[1]->[1]; }
	
#	RPerl::diag("in ...Tree::Binary::NodeReference::new_from_nested_arrayrefs(), about to return \$output =\n" . RPerl::DUMPER($output) . "\n");
    return $output;
}

# DISABLE UNUSED CODE (Using default Data::Dumper for now)
#sub DUMPER {
#    { my string::method $RETURN_TYPE };
#    (my RPerl::DataStructure::Graph::Tree::Binary::NodeReference $node) = @ARG;
#	my string $dumped = '[';
# START HERE
# START HERE
# START HERE
#	$dumped .= "**FAKE_DUMP_STRING**";
#	$dumped .= ']';
#	return $dumped;
#}


# ref to (binary tree node)
# DEV NOTE: for naming conventions, see DEV NOTE in same code section of LinkedList.pm
package  # hide from PAUSE indexing
    binarytreenoderef;
use parent qw(RPerl::DataStructure::Graph::Tree::Binary::NodeReference);
use RPerl::DataStructure::Graph::Tree::Binary::Node;
our $properties = $properties; our $new_from_nested_arrayrefs = $new_from_nested_arrayrefs; our $traverse_depthfirst_preorder = $traverse_depthfirst_preorder; our $to_nested_arrayrefs = $to_nested_arrayrefs; our $traverse_breadthfirst_queue = $traverse_breadthfirst_queue;

1;  # end of class
