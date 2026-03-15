#ifndef XIAOZHI_STANDBY_SCREEN_H
#define XIAOZHI_STANDBY_SCREEN_H

#include "ui/home/home_screen.h"

#ifdef __cplusplus
extern "C" {
#endif

rt_err_t xiaozhi_standby_screen_create(const xiaozhi_home_screen_config_t *config,
                                       xiaozhi_home_screen_refs_t *refs);

#ifdef __cplusplus
}
#endif

#endif
