# frozen_string_literal: true

require 'spec_helper'

require 'ilm/chemistry'

Atom = Ilm::Chemistry::Atom
Nucleus = Ilm::Chemistry::Nucleus
Element = Ilm::Chemistry::Element
Electron = Ilm::Chemistry::Electron
Proton = Ilm::Chemistry::Proton
Neutron = Ilm::Chemistry::Neutron

RSpec.describe Nucleus do
  let(:atom) { Atom.new }
  let(:atom_nucleus) { Nucleus.new atom: atom }

  let(:particle_nucleus) { Nucleus.new proton_count: 2, neutron_count: 2 }
  let(:atom_particle_nucleus) do
    Nucleus.new atom: atom, proton_count: 2, neutron_count: 2
  end

  let(:empty_nucleus) { Nucleus.new }

  context '#initialize' do
    context 'when_only_atom_is_given' do
      it 'should_have_the_atom' do
        expect(atom_nucleus.atom).to be atom
      end
      it 'should_have_the_element_same_as_the_atom' do
        expect(atom_nucleus.element).to be atom.element
      end
      it 'should_have_same_number_of_sub_nuclear_particles_as_the_atom' do
        expect(atom_nucleus.protons.count).to be atom.protons.count
        expect(atom_nucleus.neutrons.count).to be atom.neutrons.count
      end
    end

    context 'when_only_sub_nuclear_particle_counts_are_given' do
      it 'should_not_have_atom' do
        expect(particle_nucleus.atom).to be_nil
      end
      it 'should_have_the_element_same_as_the_atom' do
        expect(particle_nucleus.element).to be_nil
      end
      it 'should_have_given_number_of_sub_nuclear_particles' do
        expect(particle_nucleus.protons.count).to be 2
        expect(particle_nucleus.neutrons.count).to be 2
      end
    end

    context 'when_atom_and_sub_nuclear_particle_counts_are_given' do
      it 'should_have_the_atom' do
        expect(atom_particle_nucleus.atom).to be atom
      end
      it 'should_have_the_same_element_as_the_atom' do
        expect(atom_particle_nucleus.element).to be atom.element
      end
      it 'should_have_given_number_of_sub_nuclear_particles' do
        expect(atom_particle_nucleus.protons.count).to be 2
        expect(atom_particle_nucleus.neutrons.count).to be 2
      end
    end

    context 'when_neither_atom_nor_sub_nuclear_particle_count_are_given' do
      it 'should_not_have_atom' do
        expect(empty_nucleus.atom). to be_nil
      end
      it 'should_not_have_element' do
        expect(empty_nucleus.element).to be_nil
      end
      it 'should_not_have_any_sub_nuclear_particles' do
        expect(empty_nucleus.protons.count).to be_zero
        expect(empty_nucleus.neutrons.count).to be_zero
      end
    end
  end

  context '#charge' do
    it 'should_have_correct_values' do
      expect(atom_nucleus.charge).to eq 0.C
      expect(particle_nucleus.charge)
        .to eq 2 * Neutron::CHARGE + 2 * Proton::CHARGE
      expect(atom_particle_nucleus.charge)
        .to eq 2 * Neutron::CHARGE + 2 * Proton::CHARGE
      expect(empty_nucleus.charge).to eq 0.C
    end
  end

  context '#mass' do
    it 'should_have_correct_values' do
      expect(atom_nucleus.mass).to eq 0.kg
      expect(particle_nucleus.mass)
        .to eq 2 * Neutron::MASS + 2 * Proton::MASS
      expect(atom_particle_nucleus.mass)
        .to eq 2 * Neutron::MASS + 2 * Proton::MASS
      expect(empty_nucleus.mass).to eq 0.kg
    end
  end
end
