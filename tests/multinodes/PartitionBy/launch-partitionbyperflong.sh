# * (c) Copyright 2016 Hewlett Packard Enterprise Development LP
# *
# * Licensed under the Apache License, Version 2.0 (the "License");
# * you may not use this file except in compliance with the License.
# * You may obtain a copy of the License at
# *
# *     http://www.apache.org/licenses/LICENSE-2.0
# *
# * Unless required by applicable law or agreed to in writing, software
# * distributed under the License is distributed on an "AS IS" BASIS,
# * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# * See the License for the specific language governing permissions and
# * limitations under the License.
#

export SPARK_HOME=$1
echo "SPARK_HOME is chosen to be: $1"

export HOST_MACHINE=$2
echo "HOST_MACHINE (fully qualified path) is chosen to be: $2"

## in spark-defaults.conf, make sure that (1)spark.executor.extraClassPath, and 
## (2)spark.driver.extraClassPath have been set with firesteel.jar
$SPARK_HOME/bin/spark-submit --class "org.apache.spark.examples.SparkPartitionByPerformanceTestWithLong" --master spark://$HOST_MACHINE:7077  ./target/scala-2.11/simple-partitionby-computation-project_2.11-1.0.jar
