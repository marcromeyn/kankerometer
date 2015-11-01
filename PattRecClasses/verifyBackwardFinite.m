function betaHat = verifyBackwardFinite()
    q = [1 0];
    A = [.9 .1 0;0 .9 .1];
    mc = MarkovChain(q,A);

    mu_1 = 0;
    var_1 = 1;
    mu_2 = 3;
    var_2 = 2^2;
    Gauss1 = GaussD('Mean', mu_1, 'Variance', var_1);
    Gauss2 = GaussD('Mean', mu_2, 'Variance', var_2);
    Gauss = [Gauss1; Gauss2];

    X = [-0.2 2.6 1.3];
    pX = prob(Gauss, X);
    c = [1, 0.1625, 0.8266, 0.0581];

    betaHat = backward(mc, pX, c);
    shouldBe = [1.0003, 1.0393, 0; 8.4182, 9.3536, 2.0822];
    
    assert(all(abs(betaHat(:)-shouldBe(:)) < 1e-3))
end

