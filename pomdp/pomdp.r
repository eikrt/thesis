library("pomdp")

CYBSEC_POMDP <- POMDP(
    states = c("Idle", "Receiving media through MQTT", "Setting up SystemD services", "Starting Weston", "Displaying media", "Partial loss of system", "Complete loss of system"),
    actions = c("Monitor system", "Shutdown system", "Isolate system", "Intercept MQTT messaging", "Compromise Github repository" ,"Gain physical access to the device", "Exploit vulnerabilities in display", "Exploit vulnerabilities in SSH"),
    observations = c("Normal operation", "Detected suspicious activity", "Detected unusual media display", "Detected unauthorised access"),
    transition_prob = list(
        "Monitor system" = matrix(c(0.166666667,0.166666667,0.166666667,0.166666667,0.166666667,0.166666667,0.0,
                                    0.166666667,0.166666667,0.166666667,0.166666667,0.166666667,0.166666667,0.0,
                                    0.166666667,0.166666667,0.166666667,0.166666667,0.166666667,0.166666667,0.0,
                                    0.166666667,0.166666667,0.166666667,0.166666667,0.166666667,0.166666667,0.0,
                                    0.166666667,0.166666667,0.166666667,0.166666667,0.166666667,0.166666667,0.0,
                                    0.0,0.0,0.0,0.0,0.0,0.5,0.5,
                                    0.0,0.0,0.0,0.0,0.0,0.5,0.5
                                    ), nrow=7, byrow=TRUE),
        "Isolate system" = "uniform", 
        "Shutdown system" = matrix(c(0.2,0.2,0.2,0.2,0.2,0.0,0.0,
                                     0.2,0.2,0.2,0.2,0.2,0.0,0.0,
                                     0.2,0.2,0.2,0.2,0.2,0.0,0.0,
                                     0.2,0.2,0.2,0.2,0.2,0.0,0.0,
                                     0.2,0.2,0.2,0.2,0.2,0.0,0.0,
                                     0.0,0.0,0.0,0.0,0.0,0.5,0.5,
                                     0.0,0.0,0.0,0.0,0.0,0.5,0.5
                                   ), nrow=7, byrow=TRUE),

        "Intercept MQTT messaging" = matrix(c(0.0,0.0,0.5,0.5,0.0,0.0,0.0,
                                              0.0,0.0,0.5,0.5,0.0,0.0,0.0,
                                              0.0,0.0,0.5,0.5,0.0,0.0,0.0,
                                              0.0,0.0,0.5,0.5,0.0,0.0,0.0,
                                              0.0,0.0,0.5,0.5,0.0,0.0,0.0,
                                              0.0,0.0,0.5,0.5,0.0,0.0,0.0,
                                              0.0,0.0,0.5,0.5,0.0,0.0,0.0
                                              ), nrow=7, byrow=TRUE),
        
        "Compromise Github repository" = matrix(c(0.2,0.2,0.2,0.2,0.2,0.0,0.0,
                                              0.2,0.2,0.2,0.2,0.2,0.0,0.0,
                                              0.2,0.2,0.2,0.2,0.2,0.0,0.0,
                                              0.2,0.2,0.2,0.2,0.2,0.0,0.0,
                                              0.2,0.2,0.2,0.2,0.2,0.0,0.0,
                                              0.2,0.2,0.2,0.2,0.2,0.0,0.0,
                                              0.2,0.2,0.2,0.2,0.2,0.0,0.0
                                              ), nrow=7, byrow=TRUE),

        "Gain physical access to the device" = matrix(c(0.0,0.0,0.0,0.0,0.0,0.0,1.0,
                                                        0.0,0.0,0.0,0.0,0.0,0.0,1.0,
                                                        0.0,0.0,0.0,0.0,0.0,0.0,1.0,
                                                        0.0,0.0,0.0,0.0,0.0,0.0,1.0,
                                                        0.0,0.0,0.0,0.0,0.0,0.0,1.0,
                                                        0.0,0.0,0.0,0.0,0.0,0.0,1.0,
                                                        0.0,0.0,0.0,0.0,0.0,0.0,1.0
                                                        ), nrow=7, byrow=TRUE),
        
        "Exploit vulnerabilities in display" = matrix(c(0.0,0.0,0.0,0.0,0.0,1.0,0.0,
                                                        0.0,0.0,0.0,0.0,0.0,1.0,0.0,
                                                        0.0,0.0,0.0,0.0,0.0,1.0,0.0,
                                                        0.0,0.0,0.0,0.0,0.0,1.0,0.0,
                                                        0.0,0.0,0.0,0.0,0.0,1.0,0.0,
                                                        0.0,0.0,0.0,0.0,0.0,1.0,0.0,
                                                        0.0,0.0,0.0,0.0,0.0,1.0,0.0
                                                        ), nrow=7, byrow=TRUE),
        
        "Exploit vulnerabilities in SSH" = matrix(c(0.0,0.0,0.0,0.0,0.0,0.5,0.5,
                                                    0.0,0.0,0.0,0.0,0.0,0.5,0.5,
                                                    0.0,0.0,0.0,0.0,0.0,0.5,0.5,
                                                    0.0,0.0,0.0,0.0,0.0,0.5,0.5,
                                                    0.0,0.0,0.0,0.0,0.0,0.5,0.5,
                                                    0.0,0.0,0.0,0.0,0.0,1.0,0.0,
                                                    0.0,0.0,0.0,0.0,0.0,1.0,0.0
                                                    ), nrow=7, byrow=TRUE)
    ),
    observation_prob = list(
        "Monitor system" = "uniform",
        "Isolate system" = "uniform", 
        "Shutdown system" = "uniform", 
        "Intercept MQTT messaging" = "uniform", 
        "Compromise Github repository" = "uniform",
        "Gain physical access to the device" = "uniform", 
        "Exploit vulnerabilities in display" = matrix(c(1.0,0.0,0.0,0.0,
                                                        1.0,0.0,0.0,0.0,
                                                        1.0,0.0,0.0,0.0,
                                                        1.0,0.0,0.0,0.0,
                                                        1.0,0.0,0.0,0.0,
                                                        1.0,0.0,0.0,0.0,
                                                        1.0,0.0,0.0,0.0
                                    ), nrow=7, byrow=TRUE)
       ,
        "Exploit vulnerabilities in SSH" = matrix(c(0.0,0.0,0.0,1.0,
                                                    0.0,0.0,0.0,1.0,
                                                    0.0,0.0,0.0,1.0,
                                                    0.0,0.0,0.0,1.0,
                                                    0.0,0.0,0.0,1.0,
                                                    0.0,0.0,0.0,1.0,
                                                    0.0,0.0,0.0,1.0
                                    ), nrow=7, byrow=TRUE)
),
    reward = rbind(

        R_("*", "*", "*", "*", 1),
        R_("Normal operation", "Partial loss of system", "*", "*", -100),
        R_("Detected suspicious activity", "Partial loss of system", "*", "*", -100),
        R_("Detected unusual media display", "Partial loss of system", "*", "*", -100),
        R_("Detected unauthorised access", "Partial loss of system", "*", "*", -100),
        R_("Normal operation", "Complete loss of system", "*", "*", -100),
        R_("Detected suspicious activity", "Complete loss of system", "*", "*", -100),
        R_("Detected unusual media display", "Complete loss of system", "*", "*", -100),
        R_("Detected unauthorised access", "Complete loss of system", "*", "*", -100)
    ),
    start = "uniform",
    discount = 0.75,
    name = "CYBSEC Problem POMDP"
)
sol <- solve_POMDP(CYBSEC_POMDP)
sol
# sol$solution
plot_policy_graph(sol)
