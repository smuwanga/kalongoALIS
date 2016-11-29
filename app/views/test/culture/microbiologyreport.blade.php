<!DOCTYPE html>
<html>
  <head>
    <style type="text/css">
       
    table {
      border-spacing: 0;
      width: 100%;
    }
    th,
    td {
      padding: 10px 15px;
      text-align: left;
    }
    .report-body tr td {
      border-top: 1px solid #cecfd5;
    }
    .ast-head tr th {
      border-bottom: 1px solid #cecfd5;
    }
    .ast-body tr td.organism,
    .ast-body tr:last-child td {
      border-bottom: 1px solid #cecfd5;
    }
    tfoot tr th, tfoot tr td{
      border-top: 1px solid #cecfd5;
    }
    tfoot tr:first-child th, tfoot tr:first-child td{
      border-top: 0;
    }

    caption{
      text-align: left;
    }
    </style>
  </head>
  <body>
  <div id="wrap">
      <div class="container-fluid">
          <div class="row">
        @include("reportHeader")
        <table>
          <caption>Laboratory Findings</caption>
          <tbody class="report-body">
            <tr>
               <td>Appearance</td>
               <td colspan="2">Formed</td>
            </tr>
            <tr>
               <td>Wet Preparation</td>
               <td colspan="2">etc</td>
            </tr>
            <tr>
               <td>Biochemistry</td>
               <td colspan="2">Glucose unit(no), Protein unit(no), pH unit(no)</td>
            </tr>
            <tr>
               <td>Cell Count</td>
               <td colspan="2">Total WBC: cells/ul(no), Total RBC: cells/ul(no)</td>
            </tr>
            <tr>
               <td>Leishman</td>
               <td colspan="2">Differential Count: Polymorps(no), lymphocytes(no)</td>
            </tr>
            <tr>
               <td>Microscopy on organism morphology</td>
               <td  colspan="2">gram reaction(gram positive, gram negative, bacilli, cocci, diplococci), ZN(positive,negative), India Ink</td>
            </tr>
            <tr>
               <td>Serology</td>
               <td colspan="2">Crag, HBV, HCV, TPHA/RPR</td>
            </tr>
            <tr>
               <td>Culture Findings</td>
               <td  colspan="2">NBG or NSG</td>
            </tr>
            <tr>
               <td rowspan="3">Culture Findings</td>
               <td><strong>Microorganism(s)</strong></td>
               <td><strong>Corresponding Serotype(s)</strong></td>
            </tr>
            <tr>
               <td>Microorganism1</td>
               <td>Corresponding Serotype1</td>
            </tr>
            <tr>
               <td>Microorganism2</td>
               <td>Corresponding Serotype2</td>
            </tr>
          </tbody>
        </table>
        </br>
        <!-- Culture and Sensitivity analysis -->
        <table>
          <caption>Antimicrobial Susceptibility Testing(AST)</caption>
          <thead class="ast-head">
            <tr>
                <th scope="col">Organism(s)</th>
                <th scope="col">Antibiotic(s)</th>
                <th scope="col">Result(s)</th>
                <th scope="col">Comment(s)</th>
            </tr>
          </thead>

          @foreach($culture->isolated_organisms as $isolated_organism)
          <tbody class="ast-body">
            <tr>
              <td rowspan="{{$isolated_organism->drug_susceptibilities->count()}}"
                class="organism">{{$isolated_organism->organism->name}}</td>
                <?php $i = 1; ?>
              @foreach($isolated_organism->drug_susceptibilities as $drug_susceptibility)
              @if ($i != 1)
            <tr>
              @endif <?php $i++; ?>
              <td>{{$drug_susceptibility->drug->name}}</td>
              <td>{{$drug_susceptibility->drug_susceptibility_measure->symbol}}</td>
              <td>-</td>
            </tr>
            @endforeach
          </tbody>
          @endforeach
        </table>
        <table>
          <tbody class="report-body">
            <tr>
               <th>Comment</th>
               <td>ESBL Positive</td>
            </tr>
            <tr>
               <td>Result Guide</td>
               <td>S-Sensitive | R-Resistant | I-Intermediate</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </body>
</html>