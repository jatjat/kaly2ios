//
//  SubscribeResponse.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-10-02.
//

import DataAPI
import Foundation

struct IterationImpl: Iteration {
    let bestPose: Pose

    let odoPose: Pose

    let truePose: Pose

    let features: [Feature]

    let particles: [Particle]

    let slamSettings: SlamSettings

    let sessionSettings: SessionSettings

    init(itr: Ca_Joelathiessen_Kaly2_Proto_Iteration) {
        bestPose = itr.bestPose
        odoPose = itr.odoPose
        truePose = itr.truePose
        features = itr.features
        particles = itr.particles
        slamSettings = itr.slamSettings
        sessionSettings = itr.sessionSettings
    }
}

struct SubscribeResponseImpl: SubscribeResponse {
    let iteration: Iteration

    init(resp: Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse) {
        iteration = IterationImpl(itr: resp.iteration)
    }
}

extension Ca_Joelathiessen_Kaly2_Proto_Feature: Feature {}

extension Ca_Joelathiessen_Kaly2_Proto_Pose: Pose {}

extension Ca_Joelathiessen_Kaly2_Proto_SlamSettings: SlamSettings {}

extension Ca_Joelathiessen_Kaly2_Proto_SessionSettings: SessionSettings {}

extension Ca_Joelathiessen_Kaly2_Proto_Particle: Particle {}
