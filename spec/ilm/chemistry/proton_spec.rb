# frozen_string_literal: true

require 'spec_helper'

require 'ilm/chemistry'

Atom = Ilm::Chemistry::Atom
Nucleus = Ilm::Chemistry::Nucleus
Proton = Ilm::Chemistry::Proton

RSpec.describe Proton do
  let(:atom) { Atom.new }
  let(:atom_n) { Proton.new atom: atom }

  let(:nucleus) { Nucleus.new }
  let(:nucleus_n) { Proton.new nucleus: nucleus }

  let(:atom_nucleus_n) { Proton.new nucleus: nucleus, atom: atom }

  let(:empty_n) { Proton.new }

  context 'Constants' do
    it 'should_have_correct_values' do
      expect(Proton::CHARGE).to eq (1.60217646 * (10**-19)).C
      expect(Proton::MASS).to eq (1.672621898 * (10**-27)).kg
    end
  end

  context '#initialize' do
    context 'when_atom_is_given' do
      it 'should_have_the_atom' do
        expect(atom_n.atom).to be atom
      end
      it 'should_have_the_nucleus_of_the_atom' do
        expect(atom_n.nucleus).to be atom.nucleus
      end
    end

    context 'when_nucleus_is_given' do
      it 'should_have_the_atom_of_the_nucleus' do
        expect(nucleus_n.atom).to be nucleus.atom
      end
      it 'should_have_the_nucleus' do
        expect(nucleus_n.nucleus).to be nucleus
      end
    end

    context 'when_nucleus_and_atom_are_given' do
      it 'should_have_the_atom_of_the_nucleus' do
        expect(atom_nucleus_n.atom).to be nucleus.atom
      end
      it 'should_have_the_nucleus' do
        expect(atom_nucleus_n.nucleus).to be nucleus
      end
    end

    context 'when_neither_atom_nor_nucleus_are_given' do
      it 'should_not_have_an_atom' do
        expect(empty_n.atom).to be_nil
      end
      it 'should_not_have_a_nucleus' do
        expect(empty_n.nucleus).to be_nil
      end
    end
  end

  context '#atom' do
    context 'when_there_is_no_nucleus' do
      it 'should_return_nil' do
        expect(empty_n.atom).to be_nil
      end
    end
    context 'when_there_is_an_atom' do
      it 'should_return_the_nucleus_atom' do
        expect(atom_n.atom).to be atom
        expect(nucleus_n.atom).to be nucleus.atom
        expect(atom_nucleus_n.atom).to be nucleus.atom
      end
    end
  end

  context '#charge' do
    it 'should_be_correct' do
      expect(atom_n.charge).to be Proton::CHARGE
      expect(nucleus_n.charge).to be Proton::CHARGE
      expect(atom_nucleus_n.charge).to be Proton::CHARGE
      expect(empty_n.charge).to be Proton::CHARGE
    end
  end

  context '#mass' do
    it 'should_be_correct' do
      expect(atom_n.mass).to be Proton::MASS
      expect(nucleus_n.mass).to be Proton::MASS
      expect(atom_nucleus_n.mass).to be Proton::MASS
      expect(empty_n.mass).to be Proton::MASS
    end
  end
end
