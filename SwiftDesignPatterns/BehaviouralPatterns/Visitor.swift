import Foundation

protocol ReportElement {
    func accept<R>(visitor: any ReportVisitor<R>) -> R
}

class FixedPriceContract: ReportElement {
    let costPerYear: Double
    
    init(costPerYear: Double) {
        self.costPerYear = costPerYear
    }
    
    func accept<R>(visitor: any ReportVisitor<R>) -> R {
        visitor.visit(contract: self)
    }
}

class TimeAndMaterialsContract: ReportElement {
    let costPerHour: Double
    let hours: Int
    
    init(costPerHour: Double, hours: Int) {
        self.costPerHour = costPerHour
        self.hours = hours
    }
    
    func accept<R>(visitor: any ReportVisitor<R>) -> R {
        visitor.visit(contract: self)
    }
}

class SupportContract: ReportElement {
    let costPerMonth: Double
    
    init(costPerMonth: Double) {
        self.costPerMonth = costPerMonth
    }
    
    func accept<R>(visitor: any ReportVisitor<R>) -> R {
        visitor.visit(contract: self)
    }
}

protocol ReportVisitor<R> {
    associatedtype R
    
    func visit(contract: FixedPriceContract) -> R
    func visit(contract: TimeAndMaterialsContract) -> R
    func visit(contract: SupportContract) -> R
}

class MonthlyCostReportVisitor: ReportVisitor {
    typealias R = Double
    
    func visit(contract: FixedPriceContract) -> Double {
        contract.costPerYear / 12
    }
    
    func visit(contract: TimeAndMaterialsContract) -> Double {
        contract.costPerHour * Double(contract.hours)
    }
    
    func visit(contract: SupportContract) -> Double {
        contract.costPerMonth
    }
}

class YearlyCostReportVisitor: ReportVisitor {
    typealias R = Double
    
    func visit(contract: FixedPriceContract) -> Double {
        contract.costPerYear
    }
    
    func visit(contract: TimeAndMaterialsContract) -> Double {
        contract.costPerHour * Double(contract.hours)
    }
    
    func visit(contract: SupportContract) -> Double {
        contract.costPerMonth * 12
    }
}

func visitorClient() {
    let projectAlpha = FixedPriceContract(costPerYear: 10_000)
    let projectBeta = SupportContract(costPerMonth: 500)
    let projectGamma = TimeAndMaterialsContract(costPerHour: 150, hours: 10)
    let projectDelta = TimeAndMaterialsContract(costPerHour: 50, hours: 50)
    
    let projects: [ReportElement] = [projectAlpha, projectBeta, projectGamma, projectDelta]
    
    let monthlyReport = MonthlyCostReportVisitor()
    let yearlyReport = YearlyCostReportVisitor()
    
    var montlyCost = 0.0
    var yearlyCost = 0.0
    
    projects.forEach { project in
        montlyCost += project.accept(visitor: monthlyReport)
        yearlyCost += project.accept(visitor: yearlyReport)
    }
    
    print("Monthly cost is \(montlyCost)")
    print("Yealy cost is \(yearlyCost)")
}
