#!/bin/bash
sudo -E kubefwd svc -l 'app in (security-token-service,pdl-api,person-mottak,person-nav-mottak,person-freg-endring,person-freg-tilbakemelding,person-tps)'	
