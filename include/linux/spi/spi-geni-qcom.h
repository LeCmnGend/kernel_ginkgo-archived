/*
 * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 and
 * only version 2 as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */

#ifndef __SPI_GENI_QCOM_HEADER___
#define __SPI_GENI_QCOM_HEADER___

struct spi_geni_qcom_ctrl_data {
	u32 spi_cs_clk_delay;
	u32 spi_inter_words_delay;
};

<<<<<<< HEAD
struct spi_device;
int geni_spi_get_master_irq(struct spi_device *spi_slv);

=======
>>>>>>> 89a4cb10f32fdd42680f4e95820adf5690e66388
#endif /*__SPI_GENI_QCOM_HEADER___*/
