module Views
  class ArchimedesCattleProblem < Views::Base
    def title
      "archimedes' cattle problem"
    end

    def linear_matrix
      <<~LINEAR_MATRIX
        [
          [  6,  -5,   0,  -6,   0,   0,   0,   0],
          [  0,  20,  -9, -20,   0,   0,   0    0],
          [-13,   0,  42, -42,   0,   0,   0,   0],
          [  0,  -7,   0,   0,  12,  -7,   0,   0],
          [  0,   0,  -9,   0,   0,  20,  -9,   0],
          [  0,   0,   0, -11,   0,   0,  30, -11],
          [-13,   0,   0,   0, -13,   0,   0,  42],
        ]
      LINEAR_MATRIX
    end

    def continued_fraction
      <<~CF
        loop do
          beta = alpha - alpha.floor
          if beta == 0
            break
          else
            alpha = beta.reciprocal
          end
        end
      CF
    end

    def continued_fraction_enhanced
      <<~CF_ENHANCED
        def continued_fraction(root) do
          q0 = sqrt(root).floor
          alpha = (0, 1, 1)
          quotients = []

          while alpha != (q0, 1, 1) do
            a, b, c = alpha
            q = ((a + b * q0) / c).floor
            a = q * c - a
            b = b * c
            c = b**2 * root - (q * c - a)**2
            d = gcd(a, b, c)

            alpha = (a/d, b/d, c/d)
            quotients.push(q)
          end

          return quotients
        end
      CF_ENHANCED
    end

    def continued_fraction_with_convergents
      <<~CF_WITH_CONVERGENTS
        def continued_fraction(root) do
          q0 = sqrt(root).floor
          alpha = (0, 1, 1)
          quotients = []
          convergents = [(0, 1), (1, 0)]

          while alpha != (q0, 1, 1) do
            a, b, c = alpha
            q = ((a + b * q0) / c).floor
            a = q * c - a
            b = b * c
            c = b**2 * root - (q * c - a)**2
            d = gcd(a, b, c)

            alpha = (a/d, b/d, c/d)

            *rest, prev, curr = convergents
            next_convergent = (q * curr[0] + prev[0], q * curr[1] + prev[1])

            quotients.push(q)
            convergents.push(next_convergent)
          end

          return quotients
        end
      CF_WITH_CONVERGENTS
    end

    def quadratic_integer_multiply
      <<~QI_MULTIPLY
        def multiply(root, alpha, beta) do
          a, b = alpha
          c, d = beta

          return (
            a * c + b * d * root,
            a * d + b * c
          )
        end
      QI_MULTIPLY
    end

    def quadratic_integer_power
      <<~QI_POWER
        def power(root, alpha, exponent) do
          if exponent == 0
            return (1, 0)
          elseif exponent == 1
            return alpha
          else
            half_power = power(root, alpha, exponent/2)
            half_power_squared = multiply(root, half_power, half_power)

            if exponent % 2 == 0
              return half_power_squared
            else
              return multiply(root, alpha, half_power_squared)
            end
          end
        end
      QI_POWER
    end
  end
end

