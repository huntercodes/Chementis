//
//  ARModel.swift
//  RealityHD
//
//  Created by hunter downey on 4/23/23.
//

import SwiftUI
import RealityKit
import Combine

enum ModelCategory: CaseIterable {
    case element
    
    var label: String {
        get {
            switch self {
            case .element:
                return "Element"
            }
        }
    }
}

class ARModel {
    
    var name: String
    var category: ModelCategory
    var modelEntity: ModelEntity?
    var scaleCompensation: Float
    var chemicalSymbol: String
    
    private var cancellable: AnyCancellable?
    
    init(name: String, category: ModelCategory, chemicalSymbol: String, scaleCompensation: Float = 1.0) {
        self.name = name
        self.category = category
        self.chemicalSymbol = chemicalSymbol
        self.scaleCompensation = scaleCompensation
    }
    
    func loadModelEntity() {
        let fileName = self.name + ".usdz"
        
        self.cancellable = ModelEntity.loadModelAsync(named: fileName)
            .sink(receiveCompletion: { loadCompletion in
                switch loadCompletion {
                case .failure(let error):
                    print("Unable to load entity for \(fileName). Error: \(error.localizedDescription)")
                case .finished:
                    break
                }
                
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                self.modelEntity?.scale *= self.scaleCompensation
            })
    }
    
    func getElementName() -> String? {
        if category == .element {
            let parts = name.split(separator: "_")
            if parts.count >= 3 {
                return String(parts[2]).capitalizingFirstLetter()
            }
        }
        return nil
    }
    
}

struct Models {
    var arModels: [ARModel] = []
    
    init() {
        // Element Models
        let hydrogen = ARModel(name: "element_001_hydrogen", category: .element, chemicalSymbol: "H", scaleCompensation: 67 / 100)
        let helium = ARModel(name: "element_002_helium", category: .element, chemicalSymbol: "He", scaleCompensation: 67 / 100)
        let lithium = ARModel(name: "element_003_lithium", category: .element, chemicalSymbol: "Li", scaleCompensation: 67 / 100)
        let beryllium = ARModel(name: "element_004_beryllium", category: .element, chemicalSymbol: "Be", scaleCompensation: 67 / 100)
        let boron = ARModel(name: "element_005_boron", category: .element, chemicalSymbol: "B", scaleCompensation: 67 / 100)
        let carbon = ARModel(name: "element_006_carbon", category: .element, chemicalSymbol: "C", scaleCompensation: 67 / 100)
        let nitrogen = ARModel(name: "element_007_nitrogen", category: .element, chemicalSymbol: "N", scaleCompensation: 67 / 100)
        let oxygen = ARModel(name: "element_008_oxygen", category: .element, chemicalSymbol: "O", scaleCompensation: 67 / 100)
        let fluorine = ARModel(name: "element_009_fluorine", category: .element, chemicalSymbol: "F", scaleCompensation: 67 / 100)
        let neon = ARModel(name: "element_010_neon", category: .element, chemicalSymbol: "Ne", scaleCompensation: 67 / 100)
        let sodium = ARModel(name: "element_011_sodium", category: .element, chemicalSymbol: "Na", scaleCompensation: 67 / 100)
        let magnesium = ARModel(name: "element_012_magnesium", category: .element, chemicalSymbol: "Mg", scaleCompensation: 67 / 100)
        let aluminum = ARModel(name: "element_013_aluminum", category: .element, chemicalSymbol: "Al", scaleCompensation: 67 / 100)
        let silicon = ARModel(name: "element_014_silicon", category: .element, chemicalSymbol: "Si", scaleCompensation: 67 / 100)
        let phosphorus = ARModel(name: "element_015_phosphorus", category: .element, chemicalSymbol: "P", scaleCompensation: 67 / 100)
        let sulfur = ARModel(name: "element_016_sulfur", category: .element, chemicalSymbol: "S", scaleCompensation: 67 / 100)
        let chlorine = ARModel(name: "element_017_chlorine", category: .element, chemicalSymbol: "Cl", scaleCompensation: 67 / 100)
        let argon = ARModel(name: "element_018_argon", category: .element, chemicalSymbol: "Ar", scaleCompensation: 67 / 100)
        let potassium = ARModel(name: "element_019_potassium", category: .element, chemicalSymbol: "K", scaleCompensation: 67 / 100)
        let calcium = ARModel(name: "element_020_calcium", category: .element, chemicalSymbol: "Ca", scaleCompensation: 67 / 100)
        let scandium = ARModel(name: "element_021_scandium", category: .element, chemicalSymbol: "Sc", scaleCompensation: 67 / 100)
        let titanium = ARModel(name: "element_022_titanium", category: .element, chemicalSymbol: "Ti", scaleCompensation: 67 / 100)
        let vanadium = ARModel(name: "element_023_vanadium", category: .element, chemicalSymbol: "V", scaleCompensation: 67 / 100)
        let chromium = ARModel(name: "element_024_chromium", category: .element, chemicalSymbol: "Cr", scaleCompensation: 67 / 100)
        let manganese = ARModel(name: "element_025_manganese", category: .element, chemicalSymbol: "Mn", scaleCompensation: 67 / 100)
        let iron = ARModel(name: "element_026_iron", category: .element, chemicalSymbol: "Fe", scaleCompensation: 67 / 100)
        let cobalt = ARModel(name: "element_027_cobalt", category: .element, chemicalSymbol: "Co", scaleCompensation: 67 / 100)
        let nickel = ARModel(name: "element_028_nickel", category: .element, chemicalSymbol: "Ni", scaleCompensation: 67 / 100)
        let copper = ARModel(name: "element_029_copper", category: .element, chemicalSymbol: "Cu", scaleCompensation: 67 / 100)
        let zinc = ARModel(name: "element_030_zinc", category: .element, chemicalSymbol: "Zn", scaleCompensation: 67 / 100)
        let gallium = ARModel(name: "element_031_gallium", category: .element, chemicalSymbol: "Ga", scaleCompensation: 67 / 100)
        let germanium = ARModel(name: "element_032_germanium", category: .element, chemicalSymbol: "Ge", scaleCompensation: 67 / 100)
        let arsenic = ARModel(name: "element_033_arsenic", category: .element, chemicalSymbol: "As", scaleCompensation: 67 / 100)
        let selenium = ARModel(name: "element_034_selenium", category: .element, chemicalSymbol: "Se", scaleCompensation: 67 / 100)
        let bromine = ARModel(name: "element_035_bromine", category: .element, chemicalSymbol: "Br", scaleCompensation: 67 / 100)
        let krypton = ARModel(name: "element_036_krypton", category: .element, chemicalSymbol: "Kr", scaleCompensation: 67 / 100)
        let rubidium = ARModel(name: "element_037_rubidium", category: .element, chemicalSymbol: "Rb", scaleCompensation: 67 / 100)
        let strontium = ARModel(name: "element_038_strontium", category: .element, chemicalSymbol: "Sr", scaleCompensation: 67 / 100)
        let yttrium = ARModel(name: "element_039_yttrium", category: .element, chemicalSymbol: "Y", scaleCompensation: 67 / 100)
        let zirconium = ARModel(name: "element_040_zirconium", category: .element, chemicalSymbol: "Zr", scaleCompensation: 67 / 100)
        let niobium = ARModel(name: "element_041_niobium", category: .element, chemicalSymbol: "Nb", scaleCompensation: 67 / 100)
        let molybdenum = ARModel(name: "element_042_molybdenum", category: .element, chemicalSymbol: "Mo", scaleCompensation: 67 / 100)
        let technetium = ARModel(name: "element_043_technetium", category: .element, chemicalSymbol: "Tc", scaleCompensation: 67 / 100)
        let ruthenium = ARModel(name: "element_044_ruthenium", category: .element, chemicalSymbol: "Ru", scaleCompensation: 67 / 100)
        let rhodium = ARModel(name: "element_045_rhodium", category: .element, chemicalSymbol: "Rh", scaleCompensation: 67 / 100)
        let palladium = ARModel(name: "element_046_palladium", category: .element, chemicalSymbol: "Pd", scaleCompensation: 67 / 100)
        let silver = ARModel(name: "element_047_silver", category: .element, chemicalSymbol: "Ag", scaleCompensation: 67 / 100)
        let cadmium = ARModel(name: "element_048_cadmium", category: .element, chemicalSymbol: "Cd", scaleCompensation: 67 / 100)
        let indium = ARModel(name: "element_049_indium", category: .element, chemicalSymbol: "In", scaleCompensation: 67 / 100)
        let tin = ARModel(name: "element_050_tin", category: .element, chemicalSymbol: "Sn", scaleCompensation: 67 / 100)
        let antimony = ARModel(name: "element_051_antimony", category: .element, chemicalSymbol: "Sb", scaleCompensation: 67 / 100)
        let tellurium = ARModel(name: "element_052_tellurium", category: .element, chemicalSymbol: "Te", scaleCompensation: 67 / 100)
        let iodine = ARModel(name: "element_053_iodine", category: .element, chemicalSymbol: "I", scaleCompensation: 67 / 100)
        let xenon = ARModel(name: "element_054_xenon", category: .element, chemicalSymbol: "Xe", scaleCompensation: 67 / 100)
        let cesium = ARModel(name: "element_055_cesium", category: .element, chemicalSymbol: "Cs", scaleCompensation: 67 / 100)
        let barium = ARModel(name: "element_056_barium", category: .element, chemicalSymbol: "Ba", scaleCompensation: 67 / 100)
        let lanthanum = ARModel(name: "element_057_lanthanum", category: .element, chemicalSymbol: "La", scaleCompensation: 67 / 100)
        let cerium = ARModel(name: "element_058_cerium", category: .element, chemicalSymbol: "Ce", scaleCompensation: 67 / 100)
        let praseodymium = ARModel(name: "element_059_praseodymium", category: .element, chemicalSymbol: "Pr", scaleCompensation: 67 / 100)
        let neodymium = ARModel(name: "element_060_neodymium", category: .element, chemicalSymbol: "Nd", scaleCompensation: 67 / 100)
        let promethium = ARModel(name: "element_061_promethium", category: .element, chemicalSymbol: "Pm", scaleCompensation: 67 / 100)
        let samarium = ARModel(name: "element_062_samarium", category: .element, chemicalSymbol: "Sm", scaleCompensation: 67 / 100)
        let europium = ARModel(name: "element_063_europium", category: .element, chemicalSymbol: "Eu", scaleCompensation: 67 / 100)
        let gadolinium = ARModel(name: "element_064_gadolinium", category: .element, chemicalSymbol: "Gd", scaleCompensation: 67 / 100)
        let terbium = ARModel(name: "element_065_terbium", category: .element, chemicalSymbol: "Tb", scaleCompensation: 67 / 100)
        let dysprosium = ARModel(name: "element_066_dysprosium", category: .element, chemicalSymbol: "Dy", scaleCompensation: 67 / 100)
        let holmium = ARModel(name: "element_067_holmium", category: .element, chemicalSymbol: "Ho", scaleCompensation: 67 / 100)
        let erbium = ARModel(name: "element_068_erbium", category: .element, chemicalSymbol: "Er", scaleCompensation: 67 / 100)
        let thulium = ARModel(name: "element_069_thulium", category: .element, chemicalSymbol: "Tm", scaleCompensation: 67 / 100)
        let ytterbium = ARModel(name: "element_070_ytterbium", category: .element, chemicalSymbol: "Yb", scaleCompensation: 67 / 100)
        let lutetium = ARModel(name: "element_071_lutetium", category: .element, chemicalSymbol: "Lu", scaleCompensation: 67 / 100)
        let hafnium = ARModel(name: "element_072_hafnium", category: .element, chemicalSymbol: "Hf", scaleCompensation: 67 / 100)
        let tantalum = ARModel(name: "element_073_tantalum", category: .element, chemicalSymbol: "Ta", scaleCompensation: 67 / 100)
        let tungsten = ARModel(name: "element_074_tungsten", category: .element, chemicalSymbol: "W", scaleCompensation: 67 / 100)
        let rhenium = ARModel(name: "element_075_rhenium", category: .element, chemicalSymbol: "Re", scaleCompensation: 67 / 100)
        let osmium = ARModel(name: "element_076_osmium", category: .element, chemicalSymbol: "Os", scaleCompensation: 67 / 100)
        let iridium = ARModel(name: "element_077_iridium", category: .element, chemicalSymbol: "Ir", scaleCompensation: 67 / 100)
        let platinum = ARModel(name: "element_078_platinum", category: .element, chemicalSymbol: "Pt", scaleCompensation: 67 / 100)
        let gold = ARModel(name: "element_079_gold", category: .element, chemicalSymbol: "Au", scaleCompensation: 67 / 100)
        let mercury = ARModel(name: "element_080_mercury", category: .element, chemicalSymbol: "Hg", scaleCompensation: 67 / 100)
        let thallium = ARModel(name: "element_081_thallium", category: .element, chemicalSymbol: "Tl", scaleCompensation: 67 / 100)
        let lead = ARModel(name: "element_082_lead", category: .element, chemicalSymbol: "Pb", scaleCompensation: 67 / 100)
        let bismuth = ARModel(name: "element_083_bismuth", category: .element, chemicalSymbol: "Bi", scaleCompensation: 67 / 100)
        let polonium = ARModel(name: "element_084_polonium", category: .element, chemicalSymbol: "Po", scaleCompensation: 67 / 100)
        let astatine = ARModel(name: "element_085_astatine", category: .element, chemicalSymbol: "At", scaleCompensation: 67 / 100)
        let radon = ARModel(name: "element_086_radon", category: .element, chemicalSymbol: "Rn", scaleCompensation: 67 / 100)
        let francium = ARModel(name: "element_087_francium", category: .element, chemicalSymbol: "Fr", scaleCompensation: 67 / 100)
        let radium = ARModel(name: "element_088_radium", category: .element, chemicalSymbol: "Ra", scaleCompensation: 67 / 100)
        let actinium = ARModel(name: "element_089_actinium", category: .element, chemicalSymbol: "Ac", scaleCompensation: 67 / 100)
        let thorium = ARModel(name: "element_090_thorium", category: .element, chemicalSymbol: "Th", scaleCompensation: 67 / 100)
        let protactinium = ARModel(name: "element_091_protactinium", category: .element, chemicalSymbol: "Pa", scaleCompensation: 67 / 100)
        let uranium = ARModel(name: "element_092_uranium", category: .element, chemicalSymbol: "U", scaleCompensation: 67 / 100)
        let neptunium = ARModel(name: "element_093_neptunium", category: .element, chemicalSymbol: "Np", scaleCompensation: 67 / 100)
        let plutonium = ARModel(name: "element_094_plutonium", category: .element, chemicalSymbol: "Pu", scaleCompensation: 67 / 100)
        let americium = ARModel(name: "element_095_americium", category: .element, chemicalSymbol: "Am", scaleCompensation: 67 / 100)
        let curium = ARModel(name: "element_096_curium", category: .element, chemicalSymbol: "Cm", scaleCompensation: 67 / 100)
        let berkelium = ARModel(name: "element_097_berkelium", category: .element, chemicalSymbol: "Bk", scaleCompensation: 67 / 100)
        let californium = ARModel(name: "element_098_californium", category: .element, chemicalSymbol: "Cf", scaleCompensation: 67 / 100)
        let einsteinium = ARModel(name: "element_099_einsteinium", category: .element, chemicalSymbol: "Es", scaleCompensation: 67 / 100)
        let fermium = ARModel(name: "element_100_fermium", category: .element, chemicalSymbol: "Fm", scaleCompensation: 67 / 100)
        let mendelevium = ARModel(name: "element_101_mendelevium", category: .element, chemicalSymbol: "Md", scaleCompensation: 67 / 100)
        let nobelium = ARModel(name: "element_102_nobelium", category: .element, chemicalSymbol: "No", scaleCompensation: 67 / 100)
        let lawrencium = ARModel(name: "element_103_lawrencium", category: .element, chemicalSymbol: "Lr", scaleCompensation: 67 / 100)
        let rutherfordium = ARModel(name: "element_104_rutherfordium", category: .element, chemicalSymbol: "Rf", scaleCompensation: 67 / 100)
        let dubnium = ARModel(name: "element_105_dubnium", category: .element, chemicalSymbol: "Db", scaleCompensation: 67 / 100)
        let seaborgium = ARModel(name: "element_106_seaborgium", category: .element, chemicalSymbol: "Sg", scaleCompensation: 67 / 100)
        let bohrium = ARModel(name: "element_107_bohrium", category: .element, chemicalSymbol: "Bh", scaleCompensation: 67 / 100)
        let hassium = ARModel(name: "element_108_hassium", category: .element, chemicalSymbol: "Hs", scaleCompensation: 67 / 100)
        let meitnerium = ARModel(name: "element_109_meitnerium", category: .element, chemicalSymbol: "Mt", scaleCompensation: 67 / 100)
        let darmstadtium = ARModel(name: "element_110_darmstadtium", category: .element, chemicalSymbol: "Ds", scaleCompensation: 67 / 100)
        let roentgenium = ARModel(name: "element_111_roentgenium", category: .element, chemicalSymbol: "Rg", scaleCompensation: 67 / 100)
        let copernicium = ARModel(name: "element_112_copernicium", category: .element, chemicalSymbol: "Cn", scaleCompensation: 67 / 100)
        let nihonium = ARModel(name: "element_113_nihonium", category: .element, chemicalSymbol: "Nh", scaleCompensation: 67 / 100)
        let flerovium = ARModel(name: "element_114_flerovium", category: .element, chemicalSymbol: "Fl", scaleCompensation: 67 / 100)
        let moscovium = ARModel(name: "element_115_moscovium", category: .element, chemicalSymbol: "Mc", scaleCompensation: 67 / 100)
        let livermorium = ARModel(name: "element_116_livermorium", category: .element, chemicalSymbol: "Lv", scaleCompensation: 67 / 100)
        let tennessine = ARModel(name: "element_117_tennessine", category: .element, chemicalSymbol: "Ts", scaleCompensation: 67 / 100)
        let oganesson = ARModel(name: "element_118_oganesson", category: .element, chemicalSymbol: "Og", scaleCompensation: 67 / 100)
        

        self.arModels += [hydrogen, helium, lithium, beryllium, boron, carbon, nitrogen, oxygen, fluorine, neon, sodium, magnesium, aluminum, silicon, phosphorus, sulfur, chlorine, argon, potassium, calcium, scandium, titanium, vanadium, chromium, manganese, iron, cobalt, nickel, copper, zinc, gallium, germanium, arsenic, selenium, bromine, krypton, rubidium, strontium, yttrium, zirconium, niobium, molybdenum, technetium, ruthenium, rhodium, palladium, silver, cadmium, indium, tin, antimony, tellurium, iodine, xenon, cesium, barium, lanthanum, cerium, praseodymium, neodymium, promethium, samarium, europium, gadolinium, terbium, dysprosium, holmium, erbium, thulium, ytterbium, lutetium, hafnium, tantalum, tungsten, rhenium, osmium, iridium, platinum, gold, mercury, thallium, lead, bismuth, polonium, astatine, radon, francium, radium, actinium, thorium, protactinium, uranium, neptunium, plutonium, americium, curium, berkelium, californium, einsteinium, fermium, mendelevium, nobelium, lawrencium, rutherfordium, dubnium, seaborgium, bohrium, hassium, meitnerium, darmstadtium, roentgenium, copernicium, nihonium, flerovium, moscovium, livermorium, tennessine, oganesson]
        
    }
    
    func get(category: ModelCategory) -> [ARModel] {
        return arModels.filter( { $0.category == category } )
    }
}
