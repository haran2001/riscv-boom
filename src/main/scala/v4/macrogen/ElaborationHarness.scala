//******************************************************************************
// BOOM Elaboration Harness for SRAM Macro Extraction
//
// Minimal subsystem that elaborates a BoomTile to Verilog + FIRRTL annotations.
// Used by the macroplacement training data pipeline.
//
// Usage:
//   sbt "runMain boom.v4.macrogen.Elaborate --config boom.v4.macrogen.MacroGenConfig0 --output-dir output/"
//******************************************************************************

package boom.v4.macrogen

import chisel3._
import chisel3.util._

import org.chipsalliance.cde.config.{Config, Parameters, Field}
import freechips.rocketchip.subsystem._
import freechips.rocketchip.system._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.tile._
import freechips.rocketchip.devices.tilelink._
import freechips.rocketchip.prci._
import freechips.rocketchip.rocket._
import freechips.rocketchip.util._

import boom.v4.common._

/**
 * Base config providing the minimal RocketChip subsystem parameters
 * needed to elaborate a BoomTile.
 */
class MacroGenBaseConfig extends Config(
  new WithNBigCores(0) ++       // No Rocket cores
  new BaseSubsystemConfig()      // Provides base diplomacy parameters
)

/**
 * Main elaboration entry point.
 *
 * Constructs a full subsystem with a single BoomTile and generates
 * Verilog + FIRRTL annotation files.
 */
object Elaborate {

  def main(args: Array[String]): Unit = {
    var configClassName: String = ""
    var outputDir: String = "output"

    // Parse CLI arguments
    var i = 0
    while (i < args.length) {
      args(i) match {
        case "--config" =>
          i += 1
          configClassName = args(i)
        case "--output-dir" =>
          i += 1
          outputDir = args(i)
        case other =>
          System.err.println(s"Unknown argument: $other")
          System.exit(1)
      }
      i += 1
    }

    if (configClassName.isEmpty) {
      System.err.println("Usage: Elaborate --config <full.class.name> [--output-dir <dir>]")
      System.exit(1)
    }

    println(s"Elaborating config: $configClassName")
    println(s"Output directory: $outputDir")

    // Dynamically load the config class
    val configClass = Class.forName(configClassName)
    val genConfig = configClass.getDeclaredConstructor().newInstance().asInstanceOf[Config]

    // Compose with base config
    val fullConfig = new Config(genConfig ++ new MacroGenBaseConfig)

    // Create output directory
    new java.io.File(outputDir).mkdirs()

    // Elaborate using RocketChip's standard generator
    val params = fullConfig.toInstance

    // Use ChiselStage to generate Verilog and annotations
    val gen = () => LazyModule(new ExampleRocketSystem()(params)).module

    (new circt.stage.ChiselStage).execute(
      Array(
        "--target", "systemverilog",
        "--target-dir", outputDir,
        "--split-verilog"
      ),
      firrtl.AnnotationSeq(
        Seq(
          chisel3.stage.ChiselGeneratorAnnotation(gen),
          firrtl.options.TargetDirAnnotation(outputDir)
        )
      )
    )

    println(s"Elaboration complete. Output in: $outputDir")
  }
}
