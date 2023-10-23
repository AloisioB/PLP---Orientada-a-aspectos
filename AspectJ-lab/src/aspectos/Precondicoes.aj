package aspectos;

import contas.Conta;

public aspect Precondicoes {
	
	pointcut pcCreditar3(Conta c) : 
        target(c) && call(public void creditar(double));

    before(Conta c, double valor) : pcCreditar3(c) && args(valor) {
        if (valor <= 0) {
            throw new IllegalArgumentException("Valor de crédito deve ser positivo.");
        }
    }
    
    pointcut pcDebitar(Conta c) : 
        target(c) && call(public void debitar(double));

    before(Conta c, double valor) : pcDebitar(c) && args(valor) {
        if (valor <= 0) {
            throw new IllegalArgumentException("Valor de debito deve ser positivo.");
        }
        
        if (c.getSaldo() < valor) {
            throw new IllegalArgumentException("Saldo insuficiente para realizar o débito.");
        }
    }
    
//    pointcut DebitoEtranf(Conta c) : 
//        target(c) && call(public void debitar(double));
//
//    before(Conta c, double valor) : pcDebitar(c) && args(valor) {
//        if (valor <= 0) {
//            throw new IllegalArgumentException("Valor de debito deve ser positivo.");
//        }
//        
//        if (c.getSaldo() < valor && thisJoinPointStaticPart.getSignature().getName().equals("creditar")) {
//            throw new IllegalArgumentException("Saldo insuficiente para realizar o débito.");
//        } else if (c.getSaldo() < valor && thisJoinPointStaticPart.getSignature().getName().equals("transferir")) {
//        	throw new IllegalArgumentException("Saldo insuficiente para realizar a transferencia.");
//        }
//        
//    }
    
}
