# 
# neural_network_test.rb
# 
# This is a unit test file for the backpropagation neural network implemented
# in ai4r 
# 
# Author::    Sergio Fierens
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt
# 
 

require File.dirname(__FILE__) + '/../../lib/ai4r/neural_network/backpropagation'
require 'test/unit'

Ai4r::NeuralNetwork::Backpropagation.send(:public, *Ai4r::NeuralNetwork::Backpropagation.protected_instance_methods)  
Ai4r::NeuralNetwork::Backpropagation.send(:public, *Ai4r::NeuralNetwork::Backpropagation.private_instance_methods)

module Ai4r
  
  module NeuralNetwork


    class BackpropagationTest < Test::Unit::TestCase

      
      def test_init_network
        net_4_2 = Backpropagation.new([4, 2]).init_network
        assert_equal [[1.0, 1.0, 1.0, 1.0, 1.0], [1.0, 1.0]], 
          net_4_2.activation_nodes
        assert_equal 1, net_4_2.weights.size
        assert_equal 5, net_4_2.weights.first.size
        net_4_2.weights.first.each do |weights_n|
          assert_equal 2, weights_n.size  
        end
        
        net_2_2_1 = Backpropagation.new([2, 2, 1]).init_network
        assert_equal [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0]], 
          net_2_2_1.activation_nodes
        assert_equal 2, net_2_2_1.weights.size
        assert_equal 3, net_2_2_1.weights.first.size
        
        net_2_2_1.disable_bias = true
        net_2_2_1_no_bias = net_2_2_1.init_network
        assert_equal [[1.0, 1.0], [1.0, 1.0], [1.0]], 
          net_2_2_1_no_bias.activation_nodes
      end
      
      def test_eval
        #Test set 1
        net = Backpropagation.new([3, 2])
        y = net.eval([3, 2, 3])
        assert y.length == 2
        #Test set 2
        net = Backpropagation.new([2, 4, 8, 10, 7])
        y = net.eval([2, 3])
        assert y.length == 7
      end

    end

  end

end