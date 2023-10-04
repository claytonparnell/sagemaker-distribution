#!/bin/bash
set -euox pipefail

GLUE_PATH=$1
for file in "glue_pyspark/GlueKernel.py" "glue_spark/GlueKernel.py";do
    sed -i '/Print help text upon startup/i\        if "sm_analytics_runtime_check" in code:\n            return await self._complete_cell()\n' "$GLUE_PATH/$file"
    sed -i '/Print help text upon startup/i\        if "SageMakerDataWranglerPandasFinder" in code:\n            return await self._complete_cell()\n' "$GLUE_PATH/$file"
done
