# frozen_string_literal: true

require 'spec_helper'

require 'ilm/chemistry'

Atom = Ilm::Chemistry::Atom
Element = Ilm::Chemistry::Element
Electron = Ilm::Chemistry::Electron
Proton = Ilm::Chemistry::Proton
Neutron = Ilm::Chemistry::Neutron

RSpec.describe Electron do
  let(:positive_spin_e) { Electron.new spin: :+ }
  let(:negative_spin_e) { Electron.new spin: :- }

  let(:atom) { Atom.new }
  let(:atom_e) { Electron.new atom: atom }

  let(:positive_spin_atom_e) { Electron.new spin: :+, atom: atom }
  let(:negative_spin_atom_e) { Electron.new spin: :-, atom: atom }

  let(:empty_e) { Electron.new }

  context 'Constants' do
    it 'should_have_correct_values' do
      expect(Electron::CHARGE).to eq (-1.60217646 * (10**-19)).C
      expect(Electron::MASS).to eq (9.10938356 * (10**-31)).kg
      expect(Electron::SPINS).to eq(%i[+ -])
    end
  end

  context '#initialize' do
    context 'when_only_spin_is_given' do
      it 'should_have_the_correct_spin' do
        expect(positive_spin_e.spin).to be :+
        expect(negative_spin_e.spin).to be :-
      end
      it 'should_not_have_an_atom' do
        expect(positive_spin_e.atom).to be_nil
        expect(negative_spin_e.atom).to be_nil
      end
    end

    context 'when_only_atom_is_given' do
      it 'should_have_the_atom' do
        expect(atom_e.atom).to be atom
      end
      it 'should_have_a_valid_spin' do
        expect(Electron::SPINS).to include atom_e.spin
      end
    end

    context 'when_spin_and_atom_are_given' do
      it 'should_have_correct_spin' do
        expect(positive_spin_atom_e.spin).to be :+
        expect(negative_spin_atom_e.spin).to be :-
      end
      it 'should_have_the_atom' do
        expect(positive_spin_atom_e.atom).to be atom
        expect(negative_spin_atom_e.atom).to be atom
      end
    end

    context 'when_neither_spin_nor_atom_are_given' do
      it 'should_have_a_valid_spin' do
        expect(Electron::SPINS).to include empty_e.spin
      end
      it 'should_not_have_an_atom' do
        expect(empty_e.atom).to be_nil
      end
    end
  end

  context '#nucleus' do
    context 'when_there_is_no_atom' do
      it 'should_return_nil' do
        expect(positive_spin_e.nucleus).to be_nil
        expect(negative_spin_e.nucleus).to be_nil
        expect(empty_e.nucleus).to be_nil
      end
    end
    context 'when_there_is_an_atom' do
      it 'should_return_the_atoms_nuclues' do
        expect(positive_spin_atom_e.nucleus).to be atom.nucleus
        expect(negative_spin_atom_e.nucleus).to be atom.nucleus
        expect(atom_e.nucleus).to be atom.nucleus
      end
    end
  end

  context '#charge' do
    it 'should_be_correct' do
      expect(positive_spin_e.charge).to be Electron::CHARGE
      expect(negative_spin_e.charge).to be Electron::CHARGE
      expect(atom_e.charge).to be Electron::CHARGE
      expect(positive_spin_atom_e.charge).to be Electron::CHARGE
      expect(negative_spin_atom_e.charge).to be Electron::CHARGE
      expect(empty_e.charge).to be Electron::CHARGE
    end
  end

  context '#mass' do
    it 'should_be_correct' do
      expect(positive_spin_e.mass).to be Electron::MASS
      expect(negative_spin_e.mass).to be Electron::MASS
      expect(atom_e.mass).to be Electron::MASS
      expect(positive_spin_atom_e.mass).to be Electron::MASS
      expect(negative_spin_atom_e.mass).to be Electron::MASS
      expect(empty_e.mass).to be Electron::MASS
    end
  end
end
